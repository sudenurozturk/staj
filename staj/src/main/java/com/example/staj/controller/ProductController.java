package com.example.staj.controller;

import com.example.staj.model.Product;
import com.example.staj.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.List;

@RestController
@RequestMapping("/api/products")
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping("/search")
    public ResponseEntity<List<Product>> searchProducts(@RequestParam String query, @RequestParam(required = false, defaultValue = "score") String sortBy) {
        try {
            List<Product> products = productService.searchProducts(query, sortBy);
            return ResponseEntity.ok(products);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.emptyList());
        }
    }

    @GetMapping("/")
    public ResponseEntity<List<Product>> getAllProducts(@RequestParam(required = false, defaultValue = "score") String sortBy) {
        try {
            List<Product> products = productService.getAllProducts(sortBy);
            return ResponseEntity.ok(products);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.emptyList());
        }
    }
}