-- Procedures
--  Example 1: IN, OUT, INOUT procedure call example
--   Calculate the updated average rating for the movie
--   and insert it into the avg_rating OUT parameter
DELIMITER //
CREATE OR REPLACE PROCEDURE usp_update_and_get_average_rating(
    INOUT movie_id INT,
    INOUT username VARCHAR(255),
    IN user_rating DECIMAL(3, 2), -- Input: User's rating for the movie
    OUT avg_rating DECIMAL(3, 2)  -- Output: Updated average rating of the movie
)
BEGIN
    -- Insert the new rating from the user into the review table
    INSERT INTO review (movie_id, username, rating) 
    VALUES (movie_id, username, user_rating); 
    
    -- Calculate the updated average rating for the movie and insert it into the avg_rating OUT parameter
    SELECT AVG(rating)
    INTO avg_rating
    FROM review r
    WHERE r.movie_id = movie_id;

END //
DELIMITER ;

-- Set session variables
SET @movie_id = 11;
SET @username = "humber_bebis";
SET @user_rating = 4;
SET @avg_rating = NULL;
-- Call stored procedure to update rating and get average
CALL usp_update_and_get_average_rating(@movie_id, @username, @user_rating, @avg_rating); 

-- Display results: movie, user, rating, average
SELECT @movie_id, @username, @user_rating, @avg_rating;

--  Example 2: Insert into multiple tables procedure
--   Insert movie data in the movie table
--   Insert director data in the director table
--   Insert both new ids in the movie_director table to link the new entries
DELIMITER //
CREATE OR REPLACE PROCEDURE usp_insert_movie_and_director(
  IN title_in VARCHAR(100),
  IN minute_runtime_in INT,
  IN release_date_in DATE,
  IN name_in VARCHAR(255),
  IN birth_date_in DATE
)
BEGIN
  DECLARE newest_movie_id INT;
  DECLARE newest_director_id INT;

  INSERT INTO movie(title, minute_runtime, release_date)
    VALUES (title_in, minute_runtime_in, release_date_in);
  INSERT INTO director(name, birth_date)
    VALUES (name_in, birth_date_in);
  
  SELECT movie_id INTO newest_movie_id FROM movie ORDER BY movie_id DESC LIMIT 1;
  SELECT director_id INTO newest_director_id FROM director ORDER BY director_id DESC LIMIT 1;

  INSERT INTO movie_director (movie_id, director_id)
    VALUES (newest_movie_id, newest_director_id);
  -- Select the new table information
  SELECT m.title, d.name FROM movie m
    INNER JOIN movie_director md
    ON m.movie_id=md.movie_id
    INNER JOIN director d
    ON md.director_id=d.director_id
    WHERE newest_movie_id=m.movie_id;
END //
DELIMITER ;
-- Call the procedure
CALL usp_insert_movie_and_director("Rushmore", 93, "1998-12-11", "Wes Anderson", "1969-05-01");

-- Cursors
--  Example 1: Select the title of each movie 1 by 1 
--   
DELIMITER //
CREATE OR REPLACE PROCEDURE usp_list_titles()
BEGIN
    -- Declare variable to hold cursor data
    DECLARE movie_title VARCHAR(255);
    -- Declare a variable to error check if there are any rows in the movie table
    DECLARE movie_count INT DEFAULT 0;

    DECLARE done INT DEFAULT 0;
    DECLARE movie_cursor CURSOR FOR SELECT title FROM movie;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Check if there are any rows in the movie table
    SELECT COUNT(*) INTO movie_count FROM movie;
    -- If no rows exist, signal an error and exit the procedure
    IF movie_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No movies found in the database';
    END IF;

    OPEN movie_cursor;
    
    FETCH movie_cursor INTO movie_title;  -- Fetch the first row
    WHILE NOT done DO
        SELECT movie_title;
        FETCH movie_cursor INTO movie_title;  -- Fetch the next row
    END WHILE;

    CLOSE movie_cursor;
END //
DELIMITER ;

call usp_list_titles();

-- Cursor Example 2
--  In this example the cursor selects only the reviews for the movie indicated in the parameters
--  The procedure counts the total reviews in the review table for each user and weighs the rating for the selected movie based on the percentage of reviews owned by a specific user.
--  For example if user_1 owns 66% of the reviews in the table. Their rating for each movie will be worth 66% of the weighted average for that movie.
--  More reviews, more influence on movie averages
DELIMITER //
CREATE OR REPLACE PROCEDURE usp_create_weighted_average(
    INOUT movie_id INT,
    OUT weighted_avg DECIMAL(3, 2)
)
BEGIN
  DECLARE done INT DEFAULT 0;

  DECLARE curr_user_rating DECIMAL(2,1);
  DECLARE username VARCHAR(255);

  DECLARE total_user_weight_percent DECIMAL(4, 2) DEFAULT 0;
  DECLARE user_rating_count INT;
  DECLARE rating_count INT;
  DECLARE available_rating_count INT;
  DECLARE user_weight_percent DECIMAL(4, 2);

  DECLARE cursor_rating CURSOR FOR 
    SELECT r.rating, r.username FROM review r WHERE r.movie_id=movie_id;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  SET weighted_avg = 0;

  SELECT COUNT(*) INTO rating_count FROM review r;
  SELECT r.rating, r.username FROM review r WHERE r.movie_id=movie_id;
  
  OPEN cursor_rating;
  
  FETCH cursor_rating 
    INTO curr_user_rating, username;
  WHILE NOT done DO
    SELECT COUNT(*)/rating_count INTO user_weight_percent FROM review r WHERE r.username=username;
    SET total_user_weight_percent = total_user_weight_percent + user_weight_percent;
    SET weighted_avg = weighted_avg + (user_weight_percent*curr_user_rating);
    SELECT rating_count, total_user_weight_percent, user_weight_percent, weighted_avg;
    FETCH cursor_rating 
      INTO curr_user_rating, username;
  END WHILE;

  SET weighted_avg = weighted_avg/(total_user_weight_percent);

  CLOSE cursor_rating;

END //
DELIMITER ;

SET @movie_id = 10;
SET @weighted_avg = NULL;
CALL usp_create_weighted_average(@movie_id,@weighted_avg);
SELECT @weighted_avg;