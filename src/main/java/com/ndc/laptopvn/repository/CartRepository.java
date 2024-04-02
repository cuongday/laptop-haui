package com.ndc.laptopvn.repository;

import com.ndc.laptopvn.domain.Cart;
import com.ndc.laptopvn.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long>{
    Cart findByUser(User user);
}
