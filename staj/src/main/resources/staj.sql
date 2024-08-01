USE staj;
INSERT INTO Sellers (Name, PromotionStatus, Rating) VALUES ('Seller A', TRUE, 4.5);
INSERT INTO Sellers (Name, PromotionStatus, Rating) VALUES ('Seller B', FALSE, 3.7);

INSERT INTO Products (Name, Description, SellerID, Price) VALUES ('Product 1', 'Description for Product 1', 1, 100.00);
INSERT INTO Products (Name, Description, SellerID, Price) VALUES ('Product 2', 'Description for Product 2', 2, 150.00);

INSERT INTO Ratings (SellerID, RatingValue) VALUES (1, 4.5);
INSERT INTO Ratings (SellerID, RatingValue) VALUES (2, 3.7);

INSERT INTO Promotions (SellerID, PromotionValue) VALUES (1, 20.00);
INSERT INTO Promotions (SellerID, PromotionValue) VALUES (2, 0.00);
