package com.example.staj;

import com.example.staj.model.Product;
import com.example.staj.model.Seller;
import com.example.staj.service.ProductService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
public class ProductServiceTests {

	@Autowired
	private ProductService productService;

	@Test
	public void testCalculateScore() {
		Seller seller = new Seller();
		seller.setPromotionStatus(1);
		seller.setRating(4.75);

		double score = productService.calculateScore(seller);
		assertEquals(33.75, score, 0.01);
	}

	@Test
	public void testSearchProducts() {
		List<Product> products = productService.searchProducts("example", "priceAsc");
		assertNotNull(products);
		// Daha fazla kontrol ekleyebilirsiniz
	}
}
