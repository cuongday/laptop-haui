package com.ndc.laptopvn.controller.Auth;

import com.ndc.laptopvn.domain.DTO.LoginDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthenticationManager authenticationManager;

    public AuthController(AuthenticationManager authenticationManager) {
        this.authenticationManager = authenticationManager;
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginDTO body) throws Exception {
        try {
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(body.getUsername(), body.getPassword())
            );
            SecurityContextHolder.getContext().setAuthentication(authentication);
            return new ResponseEntity<>("User login successfully!.", HttpStatus.OK);
        } catch (AuthenticationException e) {
            return new ResponseEntity<>("Email or password is invalid", HttpStatus.UNAUTHORIZED);
        }
    }
}
