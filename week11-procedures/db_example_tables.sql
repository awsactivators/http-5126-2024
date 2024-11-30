-- CREATE DATABASE
DROP DATABASE http5126_movie_tables;

CREATE DATABASE http5126_movie_tables;
USE http5126_movie_tables;

-- CREATE TABLEs
CREATE TABLE movie (
  movie_id INT AUTO_INCREMENT,
  title VARCHAR(100),
  minute_runtime INT,
  release_date DATE,
  box_office INT,
  PRIMARY KEY (movie_id)
);
CREATE TABLE director (
  director_id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  birth_date DATE,
  PRIMARY KEY (director_id)
);
CREATE TABLE movie_director (
  movie_id INT,
  director_id INT,
  PRIMARY KEY (movie_id ,director_id),
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE,
  FOREIGN KEY (director_id) REFERENCES director(director_id) ON DELETE CASCADE
);
CREATE TABLE user(
  username VARCHAR(255),
  email VARCHAR(255) UNIQUE NOT NULL,
  bio VARCHAR(2000) DEFAULT 'Movie movie! WOO!',
  last_review_id INT,
  PRIMARY KEY (username)
);
CREATE TABLE review (
  review_id INT AUTO_INCREMENT,
  title VARCHAR(255),
  username VARCHAR(255) NOT NULL,
  rating DECIMAL(2,1) NOT NULL,
  content VARCHAR(2000),
  last_update DATETIME,
  movie_id INT NOT NULL,
  PRIMARY KEY (review_id),
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE,
  FOREIGN KEY (username) REFERENCES user(username) ON DELETE CASCADE,
  CHECK (rating >= 0 AND rating <= 5)
);

-- CHECK for empty string emails && add foreign key ref to last review
ALTER TABLE user
  ADD CHECK (email <> '');
ALTER TABLE user
  ADD FOREIGN KEY (last_review_id) REFERENCES review(review_id);

-- INSERT data
INSERT INTO movie (title, minute_runtime, release_date, box_office)
  VALUES ('The Banshees of Inisherin', 109, '2022-10-21', 52000000),
  ('The Truman Show', 107, '1998-06-05', 264100000),
  ('The Dark Knight', 152, '2008-07-18', 1003845358),
  ('O Brother, where art thou?', 107, '2000-08-30', 71868327);
INSERT INTO movie (title, minute_runtime, release_date)
  VALUES ('Moana 2', 152, '2024-11-27'),
  ('Get Away', 104, '2024-12-06'),
  ('The Lord of the Rings: The War of the Rohirrim', 123, '2024-12-13'),
  ('Sonic the Hedgehog 3', 102, '2024-12-20'),
  ('Nosferatu', 99, '2024-12-25'),
  ('Paddington in Peru', 134, '2025-01-17'),
  ('Captain America: Brave New World', 108, '2025-02-14');
INSERT INTO director (name)
  VALUES ('Martin McDonagh'),
  ('Peter Weir'),
  ('Christopher Nolan'),
  ('Joel Coen'),('Ethan Coen'),
  ('David G. Derrick Jr.'),('Jason Hand'),('Dana Ledoux Miller'),
  ('Steffen Haars'),
  ('Kenji Kamiyama'),
  ('Jeff Fowler'),
  ('Robert Eggers'),
  ('Dougal Wilson'),
  ('Julius Onah');
INSERT INTO movie_director (movie_id, director_id)
  VALUES (1,1),
  (2,2),
  (3,3),
  (4,4),(4,5),
  (5,6),(5,7),(5,8),
  (6,9),
  (7,10),
  (8,11),
  (9,12),
  (10,13),
  (11,14);

-- Create multiple users
INSERT INTO user(username,email)
  VALUES ('humber_bebis', 'humber.bebis@humber.ca'),
  ('movie_girl_99', 'movie99@movies.ca'),
  ('movie_dude_1021', 'moviedude1021@movies.ca'),
  ('movie_reviewer_9000', '9000reviews@movies.ca');
--  Create multiple reviews by users(5 rows created here)
--   FOR EACH new ROW inserted, after the insert is compelte, the trigger query is executed (5 rows, 5 executions)
INSERT INTO review (username,rating,movie_id,content)
  VALUES ('humber_bebis',4.5,1,"This movie rocks!"),
  ('humber_bebis',0.4,5,"This movie sucks!"),
  ('movie_girl_99',4,3,"Amazing!"),
  ('movie_girl_99',0,11,"awful."),
  ('movie_dude_1021',5,7,"Oscar or riot!");

INSERT INTO review (username,rating,movie_id)
  VALUES ('humber_bebis',4.5,2),
  ('humber_bebis',1.4,3),
  ('humber_bebis',3,4),
  ('humber_bebis',4,10),
  ('humber_bebis',4,6),
  ('humber_bebis',1,7),
  ('humber_bebis',0.1,8),
  ('movie_girl_99',2,4),
  ('movie_girl_99',1,5),
  ('movie_girl_99',5,10),
  ('movie_dude_1021',1,3);
-- Select all fields from user, notice a review_id has been filled in the last_review_id column