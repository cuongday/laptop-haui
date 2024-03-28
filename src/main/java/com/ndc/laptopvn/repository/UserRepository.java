package com.ndc.laptopvn.repository;

import com.ndc.laptopvn.domain.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User user);


    List<User> findByEmail(String email);

    User findFirstById(long id);

    void deleteById(long id);
}
