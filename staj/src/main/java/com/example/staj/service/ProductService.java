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

    public List<Product> searchProducts(String query) {
        List<Product> products = productRepository.findAll();
        String lowerCaseQuery = query.toLowerCase(); // Arama terimini küçük harfe çevir

        // Ürünleri filtrele
        List<Product> filteredProducts = products.stream()
                .filter(p -> {
                    String productName = p.getName().toLowerCase();
                    String productDescription = p.getDescription().toLowerCase();
                    // Arama terimini ürün adı veya açıklamasında bul
                    return productName.contains(lowerCaseQuery) || productDescription.contains(lowerCaseQuery);
                })
                .collect(Collectors.toList());

        // Ürünleri sıralama
        return filteredProducts.stream()
                .sorted((p1, p2) -> {
                    Seller s1 = sellerRepository.findById(p1.getSellerID()).orElse(null);
                    Seller s2 = sellerRepository.findById(p2.getSellerID()).orElse(null);
                    if (s1 == null || s2 == null) return 0;

                    double score1 = calculateScore(s1);
                    double score2 = calculateScore(s2);

                    return Double.compare(score2, score1);
                })
                .collect(Collectors.toList());
    }

    private double calculateScore(Seller seller) {
        if (seller == null) return 0.0;

        Boolean promotionStatus = seller.getPromotionStatus();
        Double rating = seller.getRating();

        // Null kontrolü ve varsayılan değer kullanımı
        double promotionScore = (promotionStatus != null && promotionStatus) ? 10 : 0;
        double ratingScore = (rating != null) ? rating * 5 : 0;

        return promotionScore + ratingScore;
    }
}
