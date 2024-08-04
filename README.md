Workbench'e aşağıdaki komutlar girilerek new.sql oluşturulur. application.properties'de kullanıcı adı ve şifrenizi girerek bağlantıyı sağlayın.


CREATE DATABASE new;
USE new;
CREATE TABLE Sellers (
    SellerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    PromotionStatus INT DEFAULT 0,
    Rating DOUBLE
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    SellerID INT,
    Price DOUBLE,
    FOREIGN KEY (SellerID) REFERENCES Sellers(SellerID)
);

CREATE TABLE Promotions (
    PromotionID INT AUTO_INCREMENT PRIMARY KEY,
    SellerID INT,
    PromotionValue DOUBLE,
    FOREIGN KEY (SellerID) REFERENCES Sellers(SellerID)
);

CREATE TABLE Ratings (
    RatingID INT AUTO_INCREMENT PRIMARY KEY,
    SellerID INT,
    RatingValue DOUBLE,
    FOREIGN KEY (SellerID) REFERENCES Sellers(SellerID)
);
INSERT INTO Sellers (Name, PromotionStatus, Rating) VALUES
('John Electronics', 1, 4.8),     -- For "Televizyon A", "Televizyon H", etc.
('Alice Gadgets', 0, 3.9),        -- For "Bilgisayar A", "Bilgisayar B", etc.
('Bob Tech', 1, 4.2),            -- For "Televizyon F", "Tablet A", etc.
('Clara Electronics', 0, 4.6),   -- For "Televizyon C", "Tablet B", etc.
('Eve Home Appliances', 1, 4.5); -- For "Televizyon G", "Klima A", etc.
INSERT INTO Products (Name, Description, SellerID, Price) VALUES
('Televizyon A', '42 inch 4K UHD TV with smart features', 1, 499.99),
('Televizyon H', '50 inch LED TV with full HD resolution', 1, 399.99),
('Bilgisayar A', 'Gaming laptop with high performance', 2, 1299.99),
('Bilgisayar B', 'High-speed laptop with SSD', 2, 1199.99),
('Televizyon F', '32 inch HD TV with built-in speakers', 3, 299.99),
('Tablet A', '10 inch Android Tablet with 64GB storage', 4, 199.99),
('Televizyon C', '55 inch 4K UHD TV with HDR', 4, 549.99),
('Tablet B', '8 inch tablet with stylus support', 4, 179.99),
('Tablet C', '12 inch tablet with detachable keyboard', 4, 299.99),
('Tablet D', '10 inch Windows tablet with 128GB storage', 4, 229.99),
('Klima A', 'Inverter Air Conditioner with remote control', 5, 699.99),
('Televizyon E', '43 inch smart TV with voice control', 1, 429.99),
('Televizyon B', '60 inch 4K TV with Dolby sound', 1, 599.99),
('Televizyon D', '40 inch LED TV with low energy consumption', 1, 349.99),
('Klima B', 'Portable air conditioner with cooling and dehumidifying', 5, 599.99),
('Televizyon G', '65 inch 4K OLED TV with ultra-thin design', 5, 899.99),
('Headphone', 'Noise-cancelling over-ear headphones', 3, 149.99),
('Klima C', 'Split Air Conditioner with Wi-Fi connectivity', 5, 749.99),
('Klima D', 'Window air conditioner with energy-saving mode', 5, 399.99);
INSERT INTO Promotions (SellerID, PromotionValue) VALUES
(1, 20.00),    -- For "John Electronics"
(3, 15.00),    -- For "Bob Tech"
(5, 10.00);    -- For "Eve Home Appliances"
INSERT INTO Ratings (SellerID, RatingValue) VALUES
(1, 4.8),      -- For "John Electronics"
(2, 3.9),      -- For "Alice Gadgets"
(3, 4.2),      -- For "Bob Tech"
(4, 4.6),      -- For "Clara Electronics"
(5, 4.5);      -- For "Eve Home Appliances"
