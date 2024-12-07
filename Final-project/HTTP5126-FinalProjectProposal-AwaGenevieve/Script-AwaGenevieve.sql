-- Create the database
CREATE DATABASE perfume_db;
USE perfume_db;

--------------------------------------------------------------------------------------------------------------


-- Table: brand
-- Stores information about perfume brands
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(255) NOT NULL UNIQUE,       
    year_founded SMALLINT UNSIGNED  NOT NULL,              
    country VARCHAR(255) NOT NULL,          
    founder VARCHAR(255) NOT NULL           
);


-- Insert values into brand table
INSERT INTO brand (name, year_founded, country, founder) VALUES
('Chanel', 1910, 'France', 'Gabrielle Chanel'),
('Dior', 1946, 'France', 'Christian Dior'),
('Gucci', 1921, 'Italy', 'Guccio Gucci'),
('Versace', 1978, 'Italy', 'Gianni Versace'),
('Tom Ford', 2005, 'USA', 'Tom Ford'),
('Yves Saint Laurent', 1961, 'France', 'Yves Saint Laurent'),
('Prada', 1913, 'Italy', 'Mario Prada'),
('Armani', 1975, 'Italy', 'Giorgio Armani'),
('Givenchy', 1952, 'France', 'Hubert de Givenchy'),
('Hugo Boss', 1924, 'Germany', 'Hugo Boss'),
('Burberry', 1856, 'UK', 'Thomas Burberry'),
('Calvin Klein', 1968, 'USA', 'Calvin Klein'),
('Hermès', 1837, 'France', 'Thierry Hermès'),
('Lancome', 1935, 'France', 'Armand Petitjean'),
('BVLGARI', 1884, 'Italy', 'Sotirios Voulgaris');


--------------------------------------------------------------------------------------------------------------



-- Table: product
-- Stores details of products offered by the brands

CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    volume_ml INT NOT NULL,
    intensity VARCHAR(50) NOT NULL,
    cost_price DECIMAL(10,2) NOT NULL, 
    brand_id INT NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- Insert values into product table
INSERT INTO product (name, volume_ml, intensity, cost_price, brand_id) VALUES
('Coco Mademoiselle', 100, 'Eau de Parfum', 120.50, 1),
('J’adore', 50, 'Eau de Toilette', 90.00, 2),
('Gucci Bloom', 75, 'Eau de Parfum', 110.00, 3),
('Bright Crystal', 90, 'Eau de Toilette', 80.00, 4),
('Black Orchid', 100, 'Eau de Parfum', 150.00, 5),
('Opium', 50, 'Eau de Parfum', 95.00, 6),
('Candy', 80, 'Eau de Toilette', 85.50, 7),
('Acqua di Giò', 100, 'Eau de Toilette', 78.00, 8),
('Gentleman', 75, 'Eau de Parfum', 102.50, 9),
('Boss Bottled', 50, 'Eau de Toilette', 70.00, 10),
('Her London Dream', 100, 'Eau de Parfum', 100.00, 11),
('CK One', 200, 'Eau de Toilette', 60.00, 12),
('Twilly', 85, 'Eau de Parfum', 115.00, 13),
('La Vie Est Belle', 100, 'Eau de Parfum', 125.00, 14),
('Omnia', 40, 'Eau de Toilette', 50.00, 15);


--------------------------------------------------------------------------------------------------------------



-- Table: note
-- Stores information about fragrance notes

CREATE TABLE note (
    note_id INT AUTO_INCREMENT PRIMARY KEY, 
    product_id INT NOT NULL,                   
    top VARCHAR(255) NOT NULL,                   
    heart VARCHAR(255) NOT NULL,                 
    base VARCHAR(255) NOT NULL,                  
    FOREIGN KEY (product_id) REFERENCES product(product_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);



-- Insert values into note table
INSERT INTO note (product_id, top, heart, base) VALUES
(1, 'Orange', 'Jasmine', 'Vanilla'),
(2, 'Magnolia', 'Rose', 'Cedarwood'),
(3, 'Rangoon Creeper', 'Tuberose', 'Musk'),
(4, 'Pomegranate', 'Peony', 'Amber'),
(5, 'Black Truffle', 'Orchid', 'Patchouli'),
(6, 'Star Anise', 'Mandarin', 'Amber'),
(7, 'Caramel', 'Benzoin', 'Musk'),
(8, 'Lime', 'Rosemary', 'Amber'),
(9, 'Pepper', 'Lavender', 'Vanilla'),
(10, 'Apple', 'Cinnamon', 'Sandalwood'),
(11, 'Lemon', 'Ginger', 'Musk'),
(12, 'Green Tea', 'Nutmeg', 'Cedar'),
(13, 'Ginger', 'Tuberose', 'Sandalwood'),
(14, 'Iris', 'Patchouli', 'Vanilla'),
(15, 'Pear', 'Almond', 'Tonka Bean');


--------------------------------------------------------------------------------------------------------------


-- Table: retail
-- Stores information about product availability in retail locations

CREATE TABLE retail (
    retail_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    region VARCHAR(255) NOT NULL
);


-- Insert values into retail table
INSERT INTO retail (store_name, region) VALUES
('Sephora', 'North America'),
('Ulta Beauty', 'North America'),
('Nordstrom', 'North America'),
('Harrods', 'Europe'),
('Selfridges', 'Europe'),
('Galeries Lafayette', 'Europe'),
('David Jones', 'Australia'),
('Myer', 'Australia'),
('Takashimaya', 'Asia'),
('Isetan', 'Asia'),
("Bloomingdale's", 'North America'),
("Macy's", 'North America'),
('La Rinascente', 'Europe'),
('Debenhams', 'Europe'),
('House of Fraser', 'Europe');


--------------------------------------------------------------------------------------------------------------


-- Table: product_retail
-- This junction table manages the many-to-many relationship between product and retail.

CREATE TABLE product_retail (
    product_id INT NOT NULL,
    retail_id INT NOT NULL,
    quantity_available INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (product_id, retail_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (retail_id) REFERENCES retail(retail_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- Insert values into product_retail table
INSERT INTO product_retail (product_id, retail_id, quantity_available, price) VALUES
(1, 1, 50, 135.00),
(2, 1, 30, 100.00),
(3, 2, 20, 120.00),
(4, 2, 25, 90.00),
(5, 3, 10, 160.00),
(6, 3, 15, 105.00),
(7, 4, 40, 95.00),
(8, 4, 35, 85.00),
(9, 5, 50, 110.00),
(10, 5, 20, 75.00),
(11, 6, 15, 120.00),
(12, 6, 25, 65.00),
(13, 7, 30, 130.00),
(14, 7, 10, 140.00),
(15, 8, 50, 55.00);


--------------------------------------------------------------------------------------------------------------


-- Table: sale
-- Stores information about product sale 

CREATE TABLE sale (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    retail_id INT NOT NULL,
    quantity_sold INT NOT NULL,
    sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (retail_id) REFERENCES retail(retail_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);


-- Insert values into sale table 
INSERT INTO sale (product_id, retail_id, quantity_sold, sale_date) VALUES
(1, 1, 5, '2024-01-01 10:00:00'),
(2, 1, 3, '2024-01-02 12:00:00'),
(3, 2, 7, '2024-01-03 14:00:00'),
(4, 2, 4, '2024-01-04 16:00:00'),
(5, 3, 6, '2024-01-05 18:00:00'),
(6, 3, 8, '2024-01-06 20:00:00'),
(7, 4, 10, '2024-01-07 09:00:00'),
(8, 4, 12, '2024-01-08 11:00:00'),
(9, 5, 2, '2024-01-09 13:00:00'),
(10, 5, 1, '2024-01-10 15:00:00'),
(11, 6, 3, '2024-01-11 17:00:00'),
(12, 6, 6, '2024-01-12 19:00:00'),
(13, 7, 5, '2024-01-13 10:30:00'),
(14, 7, 4, '2024-01-14 12:30:00'),
(15, 8, 9, '2024-01-15 14:30:00');


--------------------------------------------------------------------------------------------------------------


-- Table: audit_log
-- Stores logs for updates made to the product table
CREATE TABLE audit_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,    
    product_id INT NOT NULL,                  
    old_name VARCHAR(255) NOT NULL,           
    new_name VARCHAR(255) NOT NULL,           
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (product_id) REFERENCES product(product_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);



-- Insert values into audit_log table
INSERT INTO audit_log (product_id, old_name, new_name, change_date) VALUES
(1, 'Coco', 'Coco Mademoiselle', '2024-01-01 10:00:00'),
(2, "J'adore Original", "J’adore", '2024-01-02 12:00:00'),
(3, 'Gucci Flora', 'Gucci Bloom', '2024-01-03 14:00:00'),
(4, 'Crystal Noir', 'Bright Crystal', '2024-01-04 16:00:00');



--------------------------------------------------------------------------------------------------------------



-- Stored Procedure: usp_add_product_with_brand
-- Adds a new product along with othe related tables


DELIMITER //

CREATE PROCEDURE usp_add_product_brand_note_retail(
    IN brand_name VARCHAR(255),          
    IN year_founded YEAR,                
    IN country VARCHAR(255),             
    IN founder VARCHAR(255),            
    IN product_name VARCHAR(255),        
    IN volume_ml INT,                   
    IN intensity VARCHAR(50),           
    IN cost_price DECIMAL(10,2),
    IN top_note VARCHAR(255),            
    IN heart_note VARCHAR(255),         
    IN base_note VARCHAR(255),          
    IN store_name VARCHAR(255),         
    IN quantity_available INT,          
    IN price DECIMAL(10,2),              
    IN region VARCHAR(255)               
)
BEGIN
    -- Insert or update brand
    INSERT INTO brand (name, year_founded, country, founder)
    VALUES (brand_name, year_founded, country, founder)
    ON DUPLICATE KEY UPDATE brand_id = LAST_INSERT_ID(brand_id);

    -- Insert or update product
    INSERT INTO product (name, volume_ml, intensity, cost_price, brand_id)
    VALUES (product_name, volume_ml, intensity, cost_price, LAST_INSERT_ID())
    ON DUPLICATE KEY UPDATE product_id = LAST_INSERT_ID(product_id);

    -- Insert note
    INSERT INTO note (product_id, top, heart, base)
    VALUES (LAST_INSERT_ID(), top_note, heart_note, base_note);

    -- Insert or update retail
    INSERT INTO retail (store_name, region)
    VALUES (store_name, region)
    ON DUPLICATE KEY UPDATE retail_id = LAST_INSERT_ID(retail_id);

    -- Insert product availability in product_retail
    INSERT INTO product_retail (product_id, retail_id, quantity_available, price)
    VALUES (LAST_INSERT_ID(), LAST_INSERT_ID(), quantity_available, price)
    ON DUPLICATE KEY UPDATE price = VALUES(price), quantity_available = VALUES(quantity_available);
END //

DELIMITER ;


-- Existing Procedure
SHOW CREATE PROCEDURE usp_add_product_brand_note_retail;


-- Use case
-- Call procedure to add product, brand, note, and retail if they dont already exist

-- CALL usp_add_product_brand_note_retail(
--     'Chanel', 1910, 'France', 'Gabrielle Chanel', 
--     'Bleu de Chanel', 100, 'Eau de Parfum', 80.00,
--     'Citrus', 'Ginger', 'Sandalwood', 
--     'Sephora', 100, 120.00, 'North America'
-- );

-- -- new
-- CALL usp_add_product_brand_note_retail(
--     'Maison Francis Kurkdjian', 2009, 'France', 'Francis Kurkdjian', 
--     'Baccarat Rouge 540', 100, 'Eau de Parfum', 250.00,
--     'Saffron', 'Amberwood', 'Fir Resin', 
--     'Harrods', 20, 300.00, 'Europe'
-- );

-- New
CALL usp_add_product_brand_note_retail(
    'Jo Malone', 1994, 'UK', 'Joanne Lesley Malone', 
    'English Pear & Freesia', 50, 'Cologne', 70.00,
    'Pear', 'Freesia', 'Patchouli', 
    'Selfridges', 25, 90.00, 'Europe'
);

CALL usp_add_product_brand_note_retail(
    'Byredo', 2006, 'Sweden', 'Ben Gorham', 
    'Mojave Ghost', 100, 'Eau de Parfum', 180.00,
    'Ambrette', 'Magnolia', 'Cedarwood', 
    'Galeries Lafayette', 30, 220.00, 'Europe'
);

CALL usp_add_product_brand_note_retail(
    'Creed', 1760, 'UK', 'James Creed', 
    'Aventus', 75, 'Eau de Parfum', 250.00,
    'Bergamot', 'Pineapple', 'Oakmoss', 
    'David Jones', 20, 300.00, 'Australia'
);

-- existing brand but with unique fragrance notes and availability in a new region
CALL usp_add_product_brand_note_retail(
    'Gucci', 1921, 'Italy', 'Guccio Gucci', 
    'Gucci Guilty', 75, 'Eau de Toilette', 85.00,
    'Lavender', 'Orange Blossom', 'Patchouli', 
    'Takashimaya', 30, 120.00, 'Asia'
);


--------------------------------------------------------------------------------------------------------------



-- Trigger: trg_product_update
-- Logs updates made to the product table
DELIMITER //

CREATE TRIGGER trg_product_update
AFTER UPDATE ON product
FOR EACH ROW
BEGIN
    IF OLD.name != NEW.name THEN
        INSERT INTO audit_log (product_id, old_name, new_name, change_date)
        VALUES (OLD.product_id, OLD.name, NEW.name, NOW());
    END IF;
END;

DELIMITER ;


-- Existing Trigger
SHOW CREATE TRIGGER trg_product_update;


-- Use Case
-- Tracking update on the product table to the audit_log table
UPDATE product
SET name = 'Bleu de Chanel Intense'
WHERE name = 'Bleu de Chanel';

UPDATE product
SET name = 'Chance Eau Vive'
WHERE name = 'Chance Eau Tendre';


-- Review all updates made to the product table
SELECT * FROM audit_log WHERE product_id = 1;

--------------------------------------------------------------------------------------------------------------



-- Function: fn_get_total_profit
-- Calculates the total profit 

DELIMITER //

CREATE FUNCTION fn_get_total_profit(input_product_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_profit DECIMAL(10,2);

    -- Correct table name
    SELECT SUM((sale.quantity_sold * product_retail.price) - (sale.quantity_sold * product.cost_price)) 
    INTO total_profit
    FROM sales
    JOIN product_retail ON sale.product_id = product_retail.product_id AND sale.retail_id = product_retail.retail_id
    JOIN product ON sale.product_id = product.product_id
    WHERE sale.product_id = input_product_id;

    RETURN total_profit;
END //

DELIMITER ;


-- Existing Function
SHOW CREATE FUNCTION fn_get_total_profit;



-- Function Use case
-- Calculating revenue for a product using its ID
SELECT fn_get_total_profit(1) AS total_profit; 

-- Compare profit across multiple products
SELECT product_id, fn_get_total_profit(product_id) AS total_profit
FROM product;

-- Validate profit for a product with no sales
SELECT fn_get_total_profit(100) AS total_profit; -- gives null


--------------------------------------------------------------------------------------------------------------



-- View: fragrance_profile_view
-- Consolidates data from product, brand, note, and product_note into a single, user-friendly view.
CREATE VIEW fragrance_profile_view AS
SELECT 
    p.product_id,
    p.name AS product_name,
    p.volume_ml,
    pr.price, 
    p.intensity,
    b.name AS brand_name,
    b.country AS brand_country,
    n.top AS top_note,
    n.heart AS heart_note,
    n.base AS base_note,
    r.store_name,
    r.region
FROM product p
JOIN brand b ON p.brand_id = b.brand_id
JOIN note n ON p.product_id = n.product_id
JOIN product_retail pr ON p.product_id = pr.product_id
JOIN retail r ON pr.retail_id = r.retail_id;


-- Existing View
SHOW CREATE VIEW fragrance_profile_view;


-- View Usecases
-- Retrieve all products with a specific top note
SELECT * FROM fragrance_profile_view
WHERE top_note = 'Citrus';

-- List all products sold in a specific store
SELECT * FROM fragrance_profile_view
WHERE store_name = 'Sephora';


-- Compare fragrance profiles across brands
SELECT brand_name, product_name, top_note, heart_note, base_note
FROM fragrance_profile_view
ORDER BY brand_name, product_name;


