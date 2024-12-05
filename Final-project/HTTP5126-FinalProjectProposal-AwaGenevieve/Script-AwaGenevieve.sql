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
INSERT INTO brand (name, year_founded, country, founder)
VALUES
('Gucci', 1921, 'Italy', 'Guccio Gucci'),
('Chanel', 1910, 'France', 'Coco Chanel'),
('Dior', 1946, 'France', 'Christian Dior'),
('Versace', 1978, 'Italy', 'Gianni Versace'),
('Prada', 1913, 'Italy', 'Mario Prada'),
('Yves Saint Laurent', 1961, 'France', 'Yves Saint Laurent'),
('Tom Ford', 2005, 'USA', 'Tom Ford'),
('Calvin Klein', 1968, 'USA', 'Calvin Klein'),
('Armani', 1975, 'Italy', 'Giorgio Armani'),
('Hermes', 1837, 'France', 'Thierry Hermes'),
('Burberry', 1856, 'England', 'Thomas Burberry'),
('Valentino', 1960, 'Italy', 'Valentino Garavani'),
('Bvlgari', 1884, 'Italy', 'Sotirios Boulgaris'),
('Givenchy', 1952, 'France', 'Hubert de Givenchy'),
('Jo Malone', 1994, 'England', 'Jo Malone'),
('Lancôme', 1935, 'France', 'Armand Petitjean'),
('Marc Jacobs', 1986, 'USA', 'Marc Jacobs'),
('Hugo Boss', 1924, 'Germany', 'Hugo Boss'),
('Estee Lauder', 1946, 'USA', 'Estee Lauder'),
('Montblanc', 1906, 'Germany', 'Claus-Johannes Voss');


--------------------------------------------------------------------------------------------------------------



-- Table: product
-- Stores details of products offered by the brands
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    volume_ml INT NOT NULL,
    intensity VARCHAR(50) NOT NULL,
    brand_id INT NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);



-- Insert values into product table
INSERT INTO product (name, volume_ml, intensity, brand_id)
VALUES
('Gucci Bloom', 100, 'EDP', 1),
('Chanel No.5', 50, 'EDP', 2),
('Dior Sauvage', 100, 'EDT', 3),
('Versace Eros', 100, 'EDP', 4),
('Prada Luna Rossa', 75, 'EDT', 5),
('YSL Libre', 90, 'EDP', 6),
('Tom Ford Noir', 100, 'EDP', 7),
('Calvin Klein Eternity', 200, 'EDT', 8),
('Armani Code', 100, 'EDP', 9),
('Hermes Terre', 50, 'EDT', 10),
('Burberry Her', 100, 'EDP', 11),
('Valentino Donna Born in Roma', 100, 'EDP', 12),
('Bvlgari Man Wood Essence', 100, 'EDT', 13),
('Givenchy Gentleman', 100, 'EDP', 14),
('Jo Malone Peony & Blush Suede', 100, 'Cologne', 15),
('Lancôme La Vie Est Belle', 100, 'EDP', 16),
('Marc Jacobs Daisy', 100, 'EDT', 17),
('Hugo Boss Bottled', 100, 'EDT', 18),
('Estee Lauder Beautiful', 100, 'EDP', 19),
('Montblanc Explorer', 100, 'EDT', 20);


--------------------------------------------------------------------------------------------------------------



-- Table: note
-- Stores information about fragrance notes
CREATE TABLE note (
    note_id INT AUTO_INCREMENT PRIMARY KEY, 
    top VARCHAR(255) NOT NULL,                       
    heart VARCHAR(255) NOT NULL,                     
    base VARCHAR(255) NOT NULL                       
);



-- Insert values into note table
INSERT INTO note (top, heart, base)
VALUES
('Jasmine, Tuberose', 'Rangoon Creeper', 'Vanilla'),
('Aldehydes, Neroli', 'Jasmine, Rose', 'Musk, Amber'),
('Bergamot, Pepper', 'Lavender, Nutmeg', 'Vetiver, Cedar'),
('Mint, Lemon', 'Apple, Tonka Bean', 'Vanilla, Cedarwood'),
('Lavender, Bitter Orange', 'Clary Sage, Amber', 'Tonka Bean, Sandalwood'),
('Mandarin, Orange Blossom', 'Lavender', 'Ambergris, Musk'),
('Bergamot, Violet Leaf', 'Nutmeg, Cardamom', 'Vanilla, Leather'),
('Lemon, Bergamot', 'Jasmine, Lily of the Valley', 'Musk, Cedar'),
('Green Apple, Mint', 'Lavender, Orange Blossom', 'Amber, Vanilla'),
('Orange, Grapefruit', 'Floral, Spicy', 'Woody, Vetiver'),
('Red Berries, Pear', 'Jasmine, Violet', 'Amber, Musk'),
('Blackcurrant, Pink Pepper', 'Jasmine, Peony', 'Cashmeran, Guaiac Wood'),
('Citrus, Green', 'Cedarwood, Patchouli', 'Amber, Sandalwood'),
('Pear, Cardamom', 'Iris, Lavender', 'Vanilla, Leather'),
('Red Apple, Peony', 'Rose, Jasmine', 'Suede, Musk'),
('Blackcurrant, Pear', 'Iris, Jasmine', 'Patchouli, Vanilla'),
('Wild Strawberry, Violet', 'Jasmine, Gardenia', 'Musk, Vanilla'),
('Apple, Bergamot', 'Cinnamon, Mahogany', 'Cedarwood, Vetiver'),
('Rose, Jasmine', 'Tuberose, Orange Blossom', 'Patchouli, Sandalwood'),
('Bergamot, Clary Sage', 'Leather, Vetiver', 'Patchouli, Woody Notes');


--------------------------------------------------------------------------------------------------------------



-- Table: product_note
-- Stores many-to-many relationships between products and notes
CREATE TABLE product_note (
    product_id INT,                          
    note_id INT,                             
    PRIMARY KEY (product_id, note_id),       
    FOREIGN KEY (product_id) REFERENCES product(product_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (note_id) REFERENCES note(note_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);



-- Insert values into product_note table
INSERT INTO product_note (product_id, note_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 4),
(3, 5),
(4, 3),
(4, 5),
(4, 6),
(5, 1),
(5, 2),
(5, 6),
(6, 5),
(6, 6),
(6, 7),
(7, 2),
(7, 3),
(7, 8),
(8, 4),
(8, 7),
(8, 9),
(9, 3),
(9, 8),
(9, 10),
(10, 1),
(10, 7),
(10, 10),
(11, 2),
(11, 6),
(11, 9),
(12, 4),
(12, 8),
(12, 10),
(13, 5),
(13, 7),
(13, 9),
(14, 1),
(14, 6),
(14, 8),
(15, 2),
(15, 4),
(15, 7),
(16, 3),
(16, 6),
(16, 9),
(17, 1),
(17, 8),
(17, 10),
(18, 4),
(18, 5),
(18, 9),
(19, 2),
(19, 6),
(19, 8),
(20, 3),
(20, 7),
(20, 10);

--------------------------------------------------------------------------------------------------------------



-- Table: retail
-- Stores information about product availability in retail locations
CREATE TABLE retail (
    retail_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    product_id INT NOT NULL,
    quantity_available INT NOT NULL,
    price DECIMAL(10,2) NOT NULL, 
    region VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);



-- Insert values into retail table
INSERT INTO retail (store_name, product_id, quantity_available, price, region)
VALUES
('Sephora', 1, 50, 150.00, 'North America'),
('Ulta Beauty', 2, 30, 200.00, 'North America'),
('Nordstrom', 3, 20, 120.00, 'Europe'),
("Macy's", 4, 15, 110.00, 'USA'),
("Bloomingdale's", 5, 25, 100.00, 'USA'),
('Neiman Marcus', 6, 40, 250.00, 'Asia'),
("Dillard's", 7, 35, 180.00, 'South America'),
('Harrods', 8, 30, 140.00, 'Europe'),
('Saks Fifth Avenue', 9, 25, 220.00, 'North America'),
('Selfridges', 10, 20, 170.00, 'Europe'),
("Barney's", 11, 10, 190.00, 'North America'),
('Galeries Lafayette', 12, 15, 210.00, 'Europe'),
('David Jones', 13, 25, 180.00, 'Australia'),
('Myer', 14, 30, 200.00, 'Australia'),
('Printemps', 15, 40, 160.00, 'Europe'),
('House of Fraser', 16, 35, 220.00, 'UK'),
('Zara Stores', 17, 50, 80.00, 'Worldwide'),
("Hudson's Bay", 18, 30, 150.00, 'Canada'),
('Maison Francis', 19, 25, 250.00, 'France'),
('Bergdorf Goodman', 20, 20, 260.00, 'USA');


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
INSERT INTO audit_log (product_id, old_name, new_name, change_date)
VALUES
(6, 'YSL Libre', 'YSL Libre2', NOW()),
(11, 'Burberry Her', 'Burberry Herself', NOW()),
(14, 'Givenchy Gentleman', 'Givenchy Gentleman2', NOW());


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
    INSERT INTO product (name, volume_ml, intensity, brand_id)
    VALUES (product_name, volume_ml, intensity, LAST_INSERT_ID())
    ON DUPLICATE KEY UPDATE product_id = LAST_INSERT_ID(product_id);

    -- Insert or update note
    INSERT INTO note (top, heart, base)
    VALUES (top_note, heart_note, base_note)
    ON DUPLICATE KEY UPDATE note_id = LAST_INSERT_ID(note_id);

    -- Link product and note in product_note
    INSERT IGNORE INTO product_note (product_id, note_id)
    VALUES (LAST_INSERT_ID(), (SELECT note_id FROM note WHERE top = top_note AND heart = heart_note AND base = base_note));

    -- Insert product availability in retail
    INSERT INTO retail (store_name, product_id, quantity_available, price, region)
    VALUES (store_name, LAST_INSERT_ID(), quantity_available, price, region)
    ON DUPLICATE KEY UPDATE price = VALUES(price), quantity_available = VALUES(quantity_available);
END //

DELIMITER ;





-- Use case
-- Call procedure to add product, brand, note, and retail if they dont already exist

CALL usp_add_product_brand_note_retail(
    'Histoires de Parfums', 2000, 'France', 'Gérald Ghislain',         
    '1899 Hemingway', 120, 'EDP',                  
    'Juniper, Orange', 'Cinnamon, Iris', 'Vanilla, Amber',              
    'Harrods', 10, 300.00, 'Europe'         
);


CALL usp_add_product_brand_note_retail(
    'Amouage', 1983, 'Oman', 'Sultan Qaboos',         
    'Interlude Man', 100, 'EDP',                  
    'Bergamot, Oregano', 'Amber, Opoponax', 'Leather, Agarwood',              
    "Bloomingdale's Dubai", 20, 350.00, 'Middle East'         
);

CALL usp_add_product_brand_note_retail(
    'Le Labo', 2006, 'USA', 'Fabrice Penot',         
    'Santal 33', 50, 'EDP',                  
    'Cardamom, Iris', 'Cedarwood, Sandalwood', 'Leather, Musk',              
    'Anthropologie', 10, 280.00, 'Global'         
);

CALL usp_add_product_brand_note_retail(
    'Comme des Garçons', 1994, 'Japan', 'Rei Kawakubo',         
    'Odeur 53', 75, 'EDT',                  
    'Oxygen, Sand', 'Nail Polish, Burnt Rubber', 'Cellulose, Ink',              
    'Selfridges', 10, 200.00, 'Global'         
);


CALL usp_add_product_brand_note_retail(
    'Fenty Beauty', 2017, 'USA', 'Rihanna',         
    'Fenty Eau de Parfum', 75, 'Parfum',                  
    'Magnolia, Tangerine', 'Blueberry, Rose', 'Musk, Patchouli',              
    'Sephora', 100, 150.00, 'Global'         
);


-- Error Use Case
CALL usp_add_product_brand_note_retail(
    'Gucci', 1921, 'Italy', 'Guccio Gucci',         
    'Gucci Bloom', 100, 'EDP',                  
    'Jasmine, Tuberose', 'Rangoon Creeper', 'Vanilla',              
    'Sephora', 50, 150.00, 'North America'         
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
END //

DELIMITER ;



-- Use Case
-- Tracking update on the product table to the audit_log table
UPDATE product
SET name = 'New Product Name'
WHERE product_id = 1;



-- Review all updates made to the product table
SELECT * FROM audit_log WHERE product_id = 1;

--------------------------------------------------------------------------------------------------------------



-- Function: fn_get_total_revenue_per_product
-- Calculates the total revenue potential for a product
DELIMITER //

CREATE FUNCTION fn_get_total_revenue_per_product(input_product_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_revenue DECIMAL(10,2);
    
    SELECT SUM(quantity_available * price) INTO total_revenue
    FROM retail
    WHERE product_id = input_product_id;
    
    RETURN total_revenue;
END //

DELIMITER ;




-- Function Use case
-- Calculating revenue for a product using its ID
SELECT fn_get_total_revenue_per_product(1) AS total_revenue;

SELECT product_id, SUM(quantity_available * price)
FROM retail
GROUP BY product_id;


-- List product and their revenue
SELECT 
    p.product_id,
    p.name AS product_name,
    fn_get_total_revenue_per_product(p.product_id) AS total_revenue
FROM product p;

-- Find product with revenue above 10000
SELECT 
    p.name AS product_name,
    fn_get_total_revenue_per_product(p.product_id) AS total_revenue
FROM product p
WHERE fn_get_total_revenue_per_product(p.product_id) > 2000;

-- Rank product by highest revenue
SELECT 
    p.name AS product_name,
    fn_get_total_revenue_per_product(p.product_id) AS total_revenue
FROM product p
ORDER BY total_revenue DESC;


-- Revenue by brand
SELECT 
    b.name AS brand_name,
    SUM(fn_get_total_revenue_per_product(p.product_id)) AS total_revenue
FROM product p
JOIN brand b ON p.brand_id = b.brand_id
GROUP BY b.name;




--------------------------------------------------------------------------------------------------------------



-- View: fragrance_profile_view
-- Consolidates data from product, brand, note, and product_note into a single, user-friendly view.
CREATE VIEW fragrance_profile_view AS
SELECT 
    p.product_id,
    p.name AS product_name,
    p.volume_ml,
    r.price,
    p.intensity,
    b.name AS brand_name,
    b.country AS brand_country,
    n.top AS top_note,
    n.heart AS heart_note,
    n.base AS base_note
FROM product p
JOIN brand b ON p.brand_id = b.brand_id
JOIN product_note pn ON p.product_id = pn.product_id
JOIN note n ON pn.note_id = n.note_id
JOIN retail r ON p.product_id = r.product_id;




-- View Usecases
SELECT * FROM fragrance_profile_view
WHERE top_note LIKE '%Bergamot%';



-- Find all products containing a specific notes
SELECT product_name, brand_name, top_note, heart_note, base_note
FROM fragrance_profile_view
WHERE top_note LIKE '%Bergamot%'
   OR heart_note LIKE '%Jasmine%'
   OR base_note LIKE '%Vanilla%';



-- compare fragrance profiles accross brands
SELECT brand_name, product_name, top_note, heart_note, base_note
FROM fragrance_profile_view
WHERE brand_name IN ('Valentino', 'Dior');


-- Min and Max price
SELECT MIN(price) AS min_price, MAX(price) AS max_price
FROM fragrance_profile_view;



-- Analyze products by price range
SELECT product_name, brand_name, price, top_note, heart_note, base_note
FROM fragrance_profile_view
WHERE price BETWEEN 20 AND 350;


-- List all products and their brands by country
SELECT brand_country, brand_name, product_name
FROM fragrance_profile_view
GROUP BY brand_country, brand_name, product_name
ORDER BY brand_country;
