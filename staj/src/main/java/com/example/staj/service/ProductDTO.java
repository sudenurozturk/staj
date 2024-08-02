package com.example.staj.service;

import com.example.staj.model.Product;
import com.example.staj.model.Promotion;

public class ProductDTO {
    private Product product;
    private Promotion promotion;

    public ProductDTO(Product product, Promotion promotion) {
        this.product = product;
        this.promotion = promotion;
    }

    public Product getProduct() {
        return product;
    }

    public Promotion getPromotion() {
        return promotion;
    }
}
