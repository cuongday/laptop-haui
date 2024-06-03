package com.ndc.laptopvn.controller.admin;

import com.ndc.laptopvn.domain.Product;
import com.ndc.laptopvn.domain.ProductImage;
import com.ndc.laptopvn.service.ProductImageService;
import com.ndc.laptopvn.service.ProductService;
import com.ndc.laptopvn.service.UploadService;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class ProductController {

    private final ProductService productService;
    private  final UploadService uploadService;

    private final ProductImageService productImageService;

    public ProductController(ProductService productService,
                             UploadService uploadService,
                             ProductImageService productImageService) {
        this.productService = productService;
        this.uploadService = uploadService;
        this.productImageService = productImageService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model,
                                 @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try{
            if(pageOptional.isPresent()){
                page = Integer.parseInt(pageOptional.get());
            }else{

            }

        } catch (NumberFormatException e) {

        }

        Pageable pageable = PageRequest.of(page-1, 10);
        Page<Product> products = this.productService.fetchProducts(pageable);
        List<Product> productList = products.getContent();
        model.addAttribute("products", productList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(Model model,
                                @ModelAttribute("newProduct") @Valid Product product,
                                BindingResult newProductBindingResult,
                                @RequestParam("uploadProductFile") MultipartFile[] files){

        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors ) {
            System.out.println (error.getField() + " - " + error.getDefaultMessage());
        }

        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }


        List<String> productImages = this.uploadService.UploadFiles(files, "product");
        List<ProductImage> productImageList = new ArrayList<>();
        for(String image : productImages){
            ProductImage productImage = new ProductImage();
            productImage.setImage(image);
            productImage.setProduct(product);
            productImageList.add(productImage);
        }
        product.setImages(productImageList);
        this.productService.handleSaveProduct(product);
        this.productImageService.handleSaveProductImage(productImageList);

        return "redirect:/admin/product";
    }

    @RequestMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product product = this.productService.fetchProductById(id).get();
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        model.addAttribute("ProductImages", product.getImages());
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Optional<Product> currentProduct = this.productService.fetchProductById(id);
        model.addAttribute("newProduct", currentProduct.get());
        model.addAttribute("id", id);
        model.addAttribute("ProductImages", currentProduct.get().getImages());
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(Model model,
                                @ModelAttribute("newProduct") @Valid Product product,
                                BindingResult newProductBindingResult,
                                @RequestParam("uploadProductFile") MultipartFile[] files) {

        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors ) {
            System.out.println (error.getField() + " - " + error.getDefaultMessage());
        }

        if (newProductBindingResult.hasErrors()) {
            return "admin/product/update";
        }
        System.out.println(product.getId());
        Optional<Product> optionalProduct = this.productService.fetchProductById(product.getId());
        if(optionalProduct.isPresent()){
            Product currentProduct = optionalProduct.get();
            model.addAttribute("newProduct", currentProduct);
            if (files.length > 0) {

                this.productImageService.deleteProductImagesByProductId(currentProduct.getId());
                currentProduct.getImages().clear();

                List<String> productImages = this.uploadService.UploadFiles(files, "product");
                List<ProductImage> productImageList = new ArrayList<>();
                for(String image : productImages){
                    ProductImage productImage = new ProductImage();
                    productImage.setImage(image);
                    productImage.setProduct(product);
                    productImageList.add(productImage);
                }
                product.setImages(productImageList);
                this.productImageService.handleSaveProductImage(productImageList);
            }

            currentProduct.setName(product.getName());
            currentProduct.setPrice(product.getPrice());
            currentProduct.setDetailDesc(product.getDetailDesc());
            currentProduct.setShortDesc(product.getShortDesc());
            currentProduct.setQuantity(product.getQuantity());
            currentProduct.setFactory(product.getFactory());
            currentProduct.setTarget(product.getTarget());

            this.productService.handleSaveProduct(currentProduct);

        }





        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model,@PathVariable long id) {
        model.addAttribute("newProduct", new Product());
        model.addAttribute("id", id);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("newProduct") Product product) {
        Optional<Product> optionalProduct = this.productService.fetchProductById(product.getId());
        if(optionalProduct.isPresent()){
            Product currentProduct = optionalProduct.get();
            this.productImageService.deleteProductImagesByProductId(currentProduct.getId());
        }
        this.productService.deleteProductById(product.getId());
        return "redirect:/admin/product";
    }

    @GetMapping("/api/products/search")
    public ResponseEntity<Object> searchProducts(@RequestParam("keyword") String keyword) {
        List<Product> products = this.productService.searchProduct(keyword);
        return ResponseEntity.ok(products);
    }

}
