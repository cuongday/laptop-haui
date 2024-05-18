package com.ndc.laptopvn.domain.request;


import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@FieldDefaults(level = lombok.AccessLevel.PRIVATE)
public class ResetPassword{
    String password;
    String confirmPassword;
}
