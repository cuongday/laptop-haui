package com.ndc.laptopvn.repository;

import com.ndc.laptopvn.domain.Order;
import com.ndc.laptopvn.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long>{
    List<Order> findByUser(User user);

    Page<Order> findAll(Pageable pageable);

//    Map<LocalDate, Long> getOrdersCountByDate(Timestamp createAt);
}
