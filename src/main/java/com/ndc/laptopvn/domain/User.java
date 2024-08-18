package com.ndc.laptopvn.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Email(message = "Email không hợp lệ", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")

    private String email;

    @NotNull
    @Size(min = 3, message = "Mật khẩu phải có ít nhất 3 kí tự")
    private String password;

    @NotNull
    @Size(min = 2, message = "Họ và tên phải có ít nhẩt 2 kí tự")
    private String fullName;
    private String address;
    private String phoneNumber;
    private String avatar;
    private String gender;
    private Date dob;
    private Timestamp createAt;

    @OneToOne(mappedBy = "user")
    private ForgotPassword forgotPassword;

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

    @OneToMany(mappedBy = "user")
    @JsonIgnore
    private List<Order> orders;

    @OneToOne(mappedBy = "user")
    @JsonIgnore
    private Cart cart;

}
