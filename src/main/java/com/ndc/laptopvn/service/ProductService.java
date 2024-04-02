package com.ndc.laptopvn.service;

import com.ndc.laptopvn.domain.Cart;
import com.ndc.laptopvn.domain.Product;
import com.ndc.laptopvn.domain.User;
import com.ndc.laptopvn.repository.CartDetailRepository;
import com.ndc.laptopvn.repository.CartRepository;
import com.ndc.laptopvn.repository.ProductRepository;
import org.springframework.stereotype.Service;
import com.ndc.laptopvn.service.UserService;
import java.util.List;
import java.util.Optional;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository,
                          CartRepository cartRepository,
                          CartDetailRepository cartDetailRepository,
                          UserService userservice, UserService userService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
    }

    public Product handleSaveProduct(Product product){
        Product savedProduct = this.productRepository.save(product);
        return savedProduct;
    }

    public Optional<Product> fetchProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProductById(long id) {
        this.productRepository.deleteById(id);
    }

    public List<Product> fetchProducts() {
        return this.productRepository.findAll();
    }

    public void handleAddProductToCart(String email, long productId) {

        User user = this.userService.getUserByEmail(email);

        if(user != null){
            //check user đâ có Cart chưa? nếu chưa thì tạo mới
            Cart cart = this.cartRepository.findByUser(user);

            if(cart == null){
                // tạo mới cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(1);

                this.cartRepository.save(otherCart);
            }

            //lưu cart-detail

            Optional<Product> productOptional = this.productRepository.findById(productId);
            if(productOptional.isPresent()){
                Product realProduct = productOptional.get();
                //check xem product đã có trong cart chưa
                //nếu có rồi thì tăng số lượng lên 1
                //nếu chưa thì tạo mới
            }
        }


    }
}
