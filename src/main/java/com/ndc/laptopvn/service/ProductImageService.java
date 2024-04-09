package com.ndc.laptopvn.service;

import com.ndc.laptopvn.domain.Product;
import com.ndc.laptopvn.domain.ProductImage;
import com.ndc.laptopvn.repository.ProductImageRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductImageService {
    private final ProductImageRepository productImageRepository;

    public ProductImageService(ProductImageRepository productImageRepository) {
        this.productImageRepository = productImageRepository;
    }

    public List<ProductImage> handleSaveProductImage(List<ProductImage> productImage){
        List<ProductImage> savedProductImage = this.productImageRepository.saveAll(productImage);
        return savedProductImage;
    }

    @Transactional
    public void deleteProductImagesByProductId(Long productId){
        this.productImageRepository.deleteAllByProductId(productId);
    }
}
