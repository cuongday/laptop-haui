package com.ndc.laptopvn.repository;

import com.ndc.laptopvn.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product save(Product product);
    Product findFirstById(long id);

    List<Product> findAll();
    void deleteById(long id);

}
