package com.ndc.laptopvn.repository;

import com.ndc.laptopvn.domain.Cart;
import com.ndc.laptopvn.domain.CartDetail;
import com.ndc.laptopvn.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);
}
