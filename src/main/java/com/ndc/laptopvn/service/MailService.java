package com.ndc.laptopvn.service;

import com.ndc.laptopvn.domain.DTO.MailBody;
import com.ndc.laptopvn.domain.User;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
    private final JavaMailSender javaMailSender;

    public MailService(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }


    public void sendSimpleMessage(MailBody mailBody) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mailBody.to());
        message.setFrom("cuonghaui101@gmail.com");
        message.setSubject(mailBody.subject());
        message.setText(mailBody.content());
        javaMailSender.send(message);
    }

}
