package com.ndc.laptopvn.controller.client;

import com.ndc.laptopvn.domain.DTO.MailBody;
import com.ndc.laptopvn.domain.ForgotPassword;
import com.ndc.laptopvn.domain.User;
import com.ndc.laptopvn.domain.request.ResetPassword;
import com.ndc.laptopvn.repository.ForgotPasswordRepository;
import com.ndc.laptopvn.service.MailService;
import com.ndc.laptopvn.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.Date;
import java.util.Objects;
import java.util.Random;

@RestController
@RequestMapping("/forgot-password")
public class ForgotPasswordController {
    private final UserService userService;
    private final MailService mailService;
    private final ForgotPasswordRepository forgotPasswordRepository;
    private final PasswordEncoder passwordEncoder;

    public ForgotPasswordController(UserService userService,
                                    MailService mailService, ForgotPasswordRepository forgotPasswordRepository, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.mailService = mailService;
        this.forgotPasswordRepository = forgotPasswordRepository;
        this.passwordEncoder = passwordEncoder;
    }


    // send mail for email verification
    @PostMapping("/verify-email/{email}")
    public ResponseEntity<String> veryfyEmail(@PathVariable String email) {
        User user = this.userService.getUserByEmail(email);

        int otp = otpGenerator();
        MailBody mailBody = MailBody.builder()
                .to(email)
                .content("This is the OTP for your Forgot Password request: " + otp)
                .subject("OTP for Forgot Password request")
                .build();
        ForgotPassword fp = ForgotPassword.builder()
                .otp(otp)
                .expirationTime(new Date(System.currentTimeMillis() + 60*1000))
                .user(user)
                .build();

        mailService.sendSimpleMessage(mailBody);
        forgotPasswordRepository.save(fp);

        return ResponseEntity.ok("Email sent for verification!");
    }

    @PostMapping("/verify-otp/{otp}/{email}")
    public ResponseEntity<String> verifyOtp(@PathVariable Integer otp, @PathVariable String email) {
        User user = this.userService.getUserByEmail(email);

        ForgotPassword fp = this.forgotPasswordRepository.findByOtpAndUser(otp, user)
                .orElseThrow(() -> new RuntimeException("Invalid OTP for email: "+ email));
        if (fp.getExpirationTime().before(Date.from(Instant.now()))) {
            this.forgotPasswordRepository.deleteById(fp.getFpid());
            return new ResponseEntity<>("OTP has expired!", HttpStatus.EXPECTATION_FAILED);
        }

        return ResponseEntity.ok("OTP verified successfully!");
    }

    @PostMapping("/reset-password/{email}")
    public ResponseEntity<String> resetPassword(@RequestBody ResetPassword resetPassword,
                                                @PathVariable String email) {
        if(!Objects.equals(resetPassword.password(), resetPassword.confirmPassword())) {
            return new ResponseEntity<>("Passwords do not match!", HttpStatus.EXPECTATION_FAILED);
        }

        String encodedPassword = this.passwordEncoder.encode(resetPassword.password());
        this.userService.updatePassword(email, encodedPassword);

        return ResponseEntity.ok("Password reset successfully!");
    }

    private Integer otpGenerator() {
        Random random = new Random();
        return random.nextInt(100_000, 999_999);
    }
}
