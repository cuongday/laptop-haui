package com.ndc.laptopvn.repository;

import com.ndc.laptopvn.domain.ForgotPassword;
import com.ndc.laptopvn.domain.User;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;


public interface ForgotPasswordRepository extends JpaRepository<ForgotPassword, Integer> {
    @Query("select fp from ForgotPassword fp where fp.otp = ?1 and fp.user = ?2")
    Optional<ForgotPassword> findByOtpAndUser(Integer otp, User user);

    @Modifying
    @Transactional
    @Query(value = "delete from forgot_password fp where fp.fp_id = ?1", nativeQuery = true)
    void deleteByFpId(Integer fpId);

    @Modifying
    @Transactional
    @Query(value = "delete from forgot_password fp where fp.user_id = ?1", nativeQuery = true)
    void deleteByUserId(Long userId);
}
