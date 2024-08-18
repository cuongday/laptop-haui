package com.ndc.laptopvn.repository;

import com.ndc.laptopvn.domain.Comment;
import com.ndc.laptopvn.domain.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
    List<Comment> findAllByProduct(Product product);
    Page<Comment> findAll(Pageable pageable);

    @Query("SELECT c.message FROM Comment c " +
            "INNER JOIN Product p ON c.product.id = p.id " +
            "WHERE p.id = :productId")
    List<String> findAllMessageByProductId(Long productId);

    @Query("SELECT c FROM Comment c " +
            "INNER JOIN Product p ON c.product.id = p.id " +
            "WHERE p.id = :productId")
    List<Comment> findAllByProductId(Long productId);
}