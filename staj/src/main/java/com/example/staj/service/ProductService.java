package com.example.staj.service;

import com.example.staj.model.Product;
import com.example.staj.model.Seller;
import com.example.staj.repository.ProductRepository;
import com.example.staj.repository.SellerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private SellerRepository sellerRepository;

    public List<Product> searchProducts(String query, String sortBy) {
        List<Product> products = productRepository.findAll();
        String lowerCaseQuery = query.toLowerCase();

        // Ürünleri filtrele
        List<Product> filteredProducts = products.stream()
                .filter(p -> {
                    String productName = p.getName().toLowerCase();
                    String productDescription = p.getDescription().toLowerCase();
                    return productName.contains(lowerCaseQuery) || productDescription.contains(lowerCaseQuery);
                })
                .collect(Collectors.toList());

        // Ürünleri sıralama
        return sortProducts(filteredProducts, sortBy);
    }

    public List<Product> getAllProducts(String sortBy) {
        List<Product> products = productRepository.findAll();

        // Ürünleri sıralama
        return sortProducts(products, sortBy);
    }

    private List<Product> sortProducts(List<Product> products, String sortBy) {
        return products.stream()
                .sorted((p1, p2) -> {
                    Seller s1 = sellerRepository.findById(p1.getSellerID()).orElse(null);
                    Seller s2 = sellerRepository.findById(p2.getSellerID()).orElse(null);
                    if (s1 == null || s2 == null) return 0;

                    double score1 = calculateScore(s1);
                    double score2 = calculateScore(s2);

                    switch (sortBy) {
                        case "priceAsc":
                            return Double.compare(p1.getPrice(), p2.getPrice());
                        case "priceDesc":
                            return Double.compare(p2.getPrice(), p1.getPrice());
                        case "score":
                            return Double.compare(score2, score1);
                        default:
                            return 0;
                    }
                })
                .collect(Collectors.toList());
    }

    public double calculateScore(Seller seller) {
        if (seller == null) return 0.0;

        Integer promotionStatus = seller.getPromotionStatus();
        Double rating = seller.getRating();

        double promotionScore = (promotionStatus != null && promotionStatus == 1) ? 10 : 0;
        double ratingScore = (rating != null) ? rating * 5 : 0;

        return promotionScore + ratingScore;
    }
}
