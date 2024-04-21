package com.ndc.laptopvn.service.specification;

import com.ndc.laptopvn.domain.Product;
import com.ndc.laptopvn.domain.Product_;
import org.springframework.data.jpa.domain.Specification;

import java.util.List;

public class ProductSpecs {
    public static Specification<Product> nameLike(String name){
        return (root, query, criteriaBuilder)
                -> criteriaBuilder.like(root.get(Product_.NAME), "%"+name+"%");
    }

    public static Specification<Product> minPrice(double minPrice){
        return (root, query, criteriaBuilder)
                -> criteriaBuilder.ge(root.get(Product_.PRICE), minPrice);
    }

    public static Specification<Product> maxPrice(double maxPrice){
        return (root, query, criteriaBuilder)
                -> criteriaBuilder.le(root.get(Product_.PRICE), maxPrice);
    }

    public static Specification<Product> matchFactory(String factory){
        return (root, query, criteriaBuilder)
                -> criteriaBuilder.equal(root.get(Product_.FACTORY), factory);
    }

    public static Specification<Product> matchListFactory(List<String> factory){
        return (root, query, criteriaBuilder)
                -> criteriaBuilder.in(root.get(Product_.FACTORY)).value(factory);
    }

    public static Specification<Product> matchListTarget(List<String> target){
        return (root, query, criteriaBuilder)
                -> criteriaBuilder.in(root.get(Product_.TARGET)).value(target);
    }

    public static Specification<Product> matchPrice(double min, double max){
        return (root, query, criteriaBuilder)
                -> criteriaBuilder.and(
                        criteriaBuilder.ge(root.get(Product_.PRICE), min),
                        criteriaBuilder.le(root.get(Product_.PRICE), max));
    }

    public static Specification<Product> matchMultiplePrice(double min, double max){
        return (root, query, criteriaBuilder)
                -> criteriaBuilder.between(root.get(Product_.PRICE), min, max);
    }
}
