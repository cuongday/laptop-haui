package com.ndc.laptopvn.domain;

import jakarta.persistence.*;
import lombok.Builder;

import java.util.Date;


@Entity
@Builder
public class ForgotPassword {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer fpid;

    @Column(nullable = false)
    private Integer otp;

    @Column(nullable = false)
    private Date expirationTime;

    @OneToOne
    private User user;

    public ForgotPassword(Integer fpid, Integer otp, Date expirationTime, User user) {
        this.fpid = fpid;
        this.otp = otp;
        this.expirationTime = expirationTime;
        this.user = user;
    }

    public ForgotPassword() {
    }

    public Integer getFpid() {
        return fpid;
    }

    public void setFpid(Integer fpid) {
        this.fpid = fpid;
    }

    public Integer getOtp() {
        return otp;
    }

    public void setOtp(Integer otp) {
        this.otp = otp;
    }

    public Date getExpirationTime() {
        return expirationTime;
    }

    public void setExpirationTime(Date expirationTime) {
        this.expirationTime = expirationTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
