package com.ndc.laptopvn.repository;

import com.ndc.laptopvn.domain.Product;
import com.ndc.laptopvn.domain.ProductImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductImageRepository extends JpaRepository<ProductImage, Long>{
    void deleteAllByProductId(Long productId);
}
