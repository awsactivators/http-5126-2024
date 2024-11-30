-- Creating multiple users
--  User can access server from localhost only
CREATE USER IF NOT EXISTS 'humber'@'localhost' IDENTIFIED BY 'pass';
--  User can access server from anywhere
CREATE USER IF NOT EXISTS 'remote_user'@'%' IDENTIFIED BY 'a';
--  User can access server from location with IP of 192.168.1.100
CREATE USER IF NOT EXISTS 'home_user'@'192.168.1.100' IDENTIFIED BY 'b';

-- Global Variables
--  Set Global variable password expiration to infinite days
SET GLOBAL default_password_lifetime = 0;
--  Expire password after 90 days
SET GLOBAL default_password_lifetime = 90;

--  List all global variables or specfic ones based on criteria 
SHOW GLOBAL VARIABLES;
SHOW GLOBAL VARIABLES LIKE 'default_password_lifetime';
--  SET GLOBAL can be used set any of the global variable values

-- Changing/resetting passwords
--  This will alter the password of the currently signed in user, may cause errors
-- ALTER USER USER() IDENTIFIED BY 'newPassword';
--  Reset Password of Other User
ALTER USER 'remote_user'@'%' IDENTIFIED BY 'newPassword';

-- Change username of user
RENAME USER 'home_user'@'192.168.1.100' TO 'homeUser'@'localhost';
-- Remove a user account
DROP USER 'remote_user'@'%';
SELECT user, host FROM mysql.user;

CREATE DATABASE user_example;
USE user_example;

DELIMITER //
CREATE PROCEDURE usp_show_priveleges()
BEGIN
  SHOW GRANTS FOR 'homeUser'@'localhost';
END //
DELIMITER ;

CREATE TABLE movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

-- Priveleges
--  Show priveleges for a user
SHOW GRANTS FOR 'humber'@'localhost';
--  Grant user all priveleges then show the users priveleges
GRANT ALL PRIVILEGES ON *.*
  TO 'humber'@'localhost';
SHOW GRANTS FOR 'homeUser'@'localhost';

--  grant specific privileges to users
GRANT EXECUTE ON PROCEDURE user_example.usp_show_priveleges
  TO 'homeUser'@'localhost';
--  grant multiple specific privileges to users
GRANT SELECT, INSERT, DELETE ON user_example.movie
  TO 'homeUser'@'localhost';
CALL usp_show_priveleges();

--  remove specific privileges from user
REVOKE INSERT, DELETE ON user_example.movie
  FROM 'homeUser'@'localhost';
CALL usp_show_priveleges();
--  remove all privileges from user
REVOKE ALL PRIVILEGES, GRANT OPTION
  FROM 'humber'@'localhost';
CALL usp_show_priveleges();

