package com.ndc.laptopvn.repository;

import com.ndc.laptopvn.domain.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
    Product findFirstById(long id);
    Page<Product> findAll(Pageable pageable);
    Page<Product> findAll(Specification<Product> spec, Pageable pageable);

    List<Product> findByNameContaining(String name);

}
