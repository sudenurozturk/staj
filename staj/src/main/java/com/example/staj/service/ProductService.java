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

                    double score1 = calculateScore(p1, s1);
                    double score2 = calculateScore(p2, s2);

                    return Double.compare(score2, score1);
                })
                .collect(Collectors.toList());
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    private double calculateScore(Product product, Seller seller) {
        if (seller == null) return 0.0;

        Boolean sellerPromotionStatus = seller.getPromotionStatus();
        Double sellerRating = seller.getRating();
        Boolean productPromotionStatus = seller.getPromotionStatus(); // Ürün promosyon durumu
        Double productPrice = product.getPrice(); // Ürün fiyatı, opsiyonel eklenebilir

        double sellerPromotionScore = (sellerPromotionStatus != null && sellerPromotionStatus) ? 10 : 0;
        double productPromotionScore = (productPromotionStatus != null && productPromotionStatus) ? 10 : 0;
        double sellerRatingScore = (sellerRating != null) ? sellerRating * 5 : 0;

        // Puanlama hesaplama
        return sellerPromotionScore + productPromotionScore + sellerRatingScore;
    }
}
