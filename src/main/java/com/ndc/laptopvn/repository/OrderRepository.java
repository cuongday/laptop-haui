package com.ndc.laptopvn.repository;

import com.ndc.laptopvn.domain.Order;
import com.ndc.laptopvn.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long>{
    List<Order> findByUser(User user);
}
