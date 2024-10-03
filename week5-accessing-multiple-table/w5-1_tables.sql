CREATE TABLE director (
director_id INT NOT NULL AUTO_INCREMENT, 
name VARCHAR(255),
birth_date DATE,
PRIMARY KEY (director_id)
);

CREATE TABLE movie (
movie_id INT NOT NULL AUTO_INCREMENT, 
title VARCHAR(255),
runtime SMALLINT,
genre VARCHAR(255),
release_year SMALLINT,
director_id INT,
PRIMARY KEY (movie_id),
FOREIGN KEY (director_id) REFERENCES director(director_id)
);

CREATE TABLE actor (
actor_id INT NOT NULL AUTO_INCREMENT, 
name VARCHAR(255),
birth_date DATE,
PRIMARY KEY (actor_id)
);

-- CREATE TABLE genre (
-- movie_id INT NOT NULL AUTO_INCREMENT, 
-- title VARCHAR(255),
-- runtime SMALLINT,
-- genre VARCHAR(255),
-- release_year SMALLINT,
-- PRIMARY KEY (movie_id)
-- );

-- CREATE TABLE movie_has_person (
-- movie_id INT NOT NULL,
-- person_id INT NOT NULL
-- );

-- CREATE TABLE movie_has_genre (
-- movie_id INT NOT NULL,
-- person_id INT NOT NULL
-- );

INSERT INTO director (
name,
birth_date
) VALUES 
("Martin McDonagh","1981-11-22"),
("Peter Weir","1984-07-13"),
("Michel Gondry","1958-04-19"),
("Christopher Nolan","1953-08-08"),
("Wes Anderson","1976-01-02"),
("Bob Persichetti","1986-02-02"),
("Vicky Jenson","1983-07-01"),
("Hayao Miyazaki","1982-10-09"),
("Jim Abrahams","1987-01-22"),
("Joel Coen","1959-08-15"),
("Jon Watts","1959-04-01"),
("McG","1981-04-28"),
("Terry Gilliam","1933-02-03"),
("David Mallet","1968-12-06"),
("Max Barbakow","1939-10-29"),
("Jim Gillespie","1947-11-26"),
("Steve Pink","1987-04-22"),
("Benny Safdie","1932-05-15"),
("Peyton Reed","1967-12-18"),
("Jessica Bendinger","1951-11-05"),
("Tim Burton","1944-12-27"),
("Ethan Coen","1954-03-29"),
("Adam Shankman","1933-06-08"),
("Sam Raimi","1951-05-06"),
("Keenen Ivory Wayans","1988-07-26"),
("Andrew Bush","1985-01-16"),
("Jason Howden","1963-10-16"),
("D.J. MacHale","1934-12-22"),
("Tommy O'Haver","1937-01-19"),
("Taika Waititi","1974-12-13"),
("Danny Cannon","1941-10-16"),
("Paco Cabezas","1939-12-19"),
("Quentin Dupieux","1980-10-13"),
("Tommy Wiseau","1946-05-21"),
("Tim Ritter","1983-06-12"),
("Richard Shepard","1943-11-16"),
("Kenny Ortega","1954-06-26"),
("Duwayne Dunham","1977-12-19"),
("Felix Herngren","1936-08-04"),
("Stephen Hillenburg","1964-09-25"),
("Lin-Manuel Miranda","1937-02-04"),
("James Sweeney","1973-09-22"),
("Shawn Levy","1935-02-28"),
("David Greene","1962-04-24"),
("Richard Curtis","1937-10-13"),
("Anne Fletcher","1936-03-26"),
("John McTiernan","1969-02-05"),
("Lorene Scafaria","1932-11-07"),
("Gil Junger","1970-10-23"),
("Jay Roach","1975-05-06"),
("Edgar Wright","1981-12-10"),
("David Wain","1942-08-06"),
("Jon M. Chu","1968-08-31"),
("Peter Farrelly","1980-02-19"),
("Bennett Miller","1949-09-16"),
("Dennis Dugan","1947-05-06"),
("Jason Moore","1967-12-09"),
("Byron Howard","1930-02-14"),
("Greta Gerwig","1961-07-17"),
("Olivia Wilde","1974-08-10"),
("John Krasinski","1945-12-28"),
("Jared Hess","1989-12-27"),
("Spike Jonze","1976-01-25"),
("Dexter Fletcher","1978-03-10"),
("James Gunn","1980-05-14"),
("Emerald Fennell","1943-11-06"),
("Jonathan Dayton","1986-01-13"),
("Salvatore D'Alia","1987-07-29"),
("Noah Baumbach","1984-03-31"),
("Sofia Coppola","1936-07-24"),
("Phyllida Lloyd","1944-02-11"),
("Damien Chazelle","1942-03-15"),
("Steven Spielberg","1934-12-12"),
("George Lucas","1933-09-29"),
("Aaron Sorkin","1987-01-29"),
("Valerie Faris","1947-06-13"),
("Mary Harron","1975-08-22"),
("Quentin Tarantino","1953-10-28"),
("Ruben Fleischer","1936-11-22"),
("Stanley Kubrick","1942-03-19"),
("Emma Seligman","1974-01-26"),
("Robert Luketic","1946-01-23"),
("Todd Phillips","1953-03-24"),
("John Hughes","1942-01-29"),
("Mark Waters","1943-11-12"),
("Kenneth Branagh","1936-05-22"),
("Alexander Payne","1973-01-24"),
("Raine Allen-Miller","1943-04-30"),
("Pete Docter","1952-07-16"),
("Glenn Ficarra","1930-10-20"),
("Sean Durkin","1936-12-15"),
("Cameron Crowe","1988-07-22"),
("Celine Song","1966-01-14"),
("Justine Triet","1933-05-09"),
("Matt Johnson","1969-05-08"),
("David Dobkin","1948-03-31"),
("Aaron Horvath","1985-09-21"),
("Yorgos Lanthimos","1947-11-27"),
("Zach Braff","1961-03-04"),
("Sammi Cohen","1961-05-06"),
("Ira Sachs","1979-06-22"),
("John Whitesell","1941-06-29"),
("Martin Scorsese","1932-06-11"),
("Jonah Feingold","1979-12-15"),
("Gavin O'Connor","1933-05-26"),
("Jake Johnson","1964-07-08"),
("Domee Shi","1970-06-05"),
("Christopher Ashley","1933-02-21"),
("Darren Aronofsky","1988-03-06"),
("Jon Turteltaub","1973-01-14"),
("Roman Polanski","1984-01-28"),
("Mike Judge","1988-04-12"),
("Donald Petrie","1988-09-26"),
("Kenneth Lonergan","1943-02-12"),
("Will Gluck","1987-02-11"),
("Frank Oz","1954-07-31"),
("Zelda Williams","1979-04-17");

INSERT INTO director () VALUES ();
INSERT INTO director (name) VALUES ("Matthew Bebis");

INSERT INTO movie (
title,
runtime,
genre,
release_year,
director_id
) VALUES 
("The Banshees of Inisherin", 109, "Drama", 2022,1),
("The Truman Show", 107, "Drama", 1998,2),
("Eternal Sunshine of the Spotless Mind", 108, "Romance", 2004,3),
("The Dark Knight", 152, "Action",2008,4),
("The Grand Budapest Hotel", 99, "Comedy",2014,5),
("Spider-Man: Into the Spider-Verse", 116, "Animation", 2018,6),
("Shrek", 89, "Animation", 2001,7),
("Spirited Away", 125, "Animation", 2001,8);

INSERT INTO movie (
title,
genre
) VALUES 
("Incredibles 3", "Animation");

INSERT INTO movie (
title,
runtime,
genre,
release_year,
director_id
) VALUES ("Airplane!", 88, "Comedy", 1980, 9),
("O Brother, Where Art Thou?",107,"Adventure, Comedy, Crime",2000, 10),
("Spiderman: No Way Home",148,"Action, Adventure, Fantasy",2021, 11),
("The Babysitter",85,"Comedy, Horror",2017, 12),
("Monty Python and the Holy Grail",91,"Adventure, Comedy, Fantasy",1975, 13),
("Joseph and the Amazing Technicolor Dreamcoat",76,"Musical",1999, 14),
("Palm Springs",90,"Comedy, Fantasy, Mystery",2020, 15),
("I Know What You Did Last Summer",101,"Horror, Mystery",1997, 16),
("Accepted",93,"Comedy",2006, 17),
("Uncut Gems",135,"Crime, Drama, Thriller",2019, 18),
("Bring It On",98,"Comedy, Romance, Sport",2000, 19),
("Stick It",103,"Comedy, Drama, Sport",2006, 20),
("Sweeney Todd: The Demon Barber of Fleet Street",116,"Drama, Horror, Musical",2007, 21),
("Burn After Reading",96,"Comedy, Crime, Drama",2008, 22),
("Hairspray",117,"Comedy, Drama, Musical",2007, 23),
("Doctor Strange in the Multiverse of Madness",126,"Action, Adventure, Fantasy",2022, 24),
("Scary Movie",88,"Comedy",2000, 25),
("Roller Town",80,"Comedy",2011, 26),
("Guns Akimbo",98,"Action, Comedy, Crime",2019, 27),
("Tower of Terror",89,"Horror, Thriller, Comedy",1997, 28),
("Ella Enchanted",96,"Comedy, Family, Fantasy",2004, 29),
("Thor: Love and Thunder",118,"Action, Adventure, Comedy",2022, 30),
("I Still Know What You Did Last Summer",100,"Horror, Mystery, Thriller",1998, 31),
("Mr. Right",95,"Action, Comedy, Romance",2015, 32),
("Rubber",82,"Comedy, Fantasy, Horror",2010, 33),
("The Room",99,"Drama",2003, 34),
("Sharks of the Corn",105,"Horror",2021, 35),
("The Perfection",90,"Drama, Horror, Music",2018, 36),
("Hocus Pocus",96,"Comedy, Family, Fantasy",1993, 37),
("Halloweentown",84,"Adventure, Comedy, Family",1998, 38),
("100 Year Old Man Who Climbed Out The Window and Disappeared",114,"Adventure, Comedy",2013, 39),
("The Spongebob Squarepants Movie",87,"Animation, Adventure, Comedy",2004, 40),
("Tick, Tick... Boom!",120,"Biography, Comedy, Drama",2021, 41),
("Straight Up",95,"Comedy, Romance",2019, 42),
("Night at the Museum",108,"Adventure, Comedy, Family",2006, 43),
("Godspell",103,"Comedy, Drama, Musical",1973, 44),
("Love Actually",135,"Comedy, Drama, Romance",2003, 45),
("The Proposal",108,"Comedy, Drama, Romance",2009, 46),
("Die Hard",132,"Action, Thriller",1988, 47),
("Seeking a Friend For the End of the World",101,"Adventure, Comedy, Drama",2012, 48),
("10 Things I Hate About You",97,"Comedy, Drama, Romance",1999, 49),
("Meet the Parents",108,"Comedy, Romance",2000, 50),
("Scott Pilgrim vs. The World",112,"Action, Comedy, Fantasy",2010, 51),
("A Futile and Stupid Gesture ",101,"Biography, Comedy",2018, 52),
("In the Heights",143,"Drama, Musical, Romance",2021, 53),
("Green Book",130,"Biography, Comedy, Drama",2018, 54),
("Moneyball",133,"Biography, Drama, Sport",2011, 55),
("The Benchwarmers",85,"Comedy, Sport",2006, 56),
("Pitch Perfect",112,"Comedy, Music, Romance",2012, 57),
("Zootopia",108,"Animation, Adventure, Comedy",2016, 58),
("Lady bird",94,"Comedy, Drama",2017, 59),
("Booksmart",102,"Comedy",2019, 60),
("A Quiet Place",90,"Drama, Horror, Sci-Fi",2018, 61),
("Napoleon Dynamite",96,"Comedy",2004, 62),
("Her",126,"Drama, Romance, Sci-Fi",2013, 63),
("Rocketman",121,"Biography, Drama, Music",2019, 64),
("Inside Llewyn Davis",104,"Drama, Music",201, 22),
("Guardians of the Galaxy",121,"Action, Adventure, Comedy",2014, 65),
("Promising Young Woman",113,"Crime, Drama, Mystery",2020, 66),
("Ruby Sparks",104,"Comedy, Drama, Fantasy",2012, 67),
("Anchorman",94,"Comedy",2004, 68),
("Frances Ha",86,"Comedy, Drama, Romance",2012, 69),
("Lost in Translation",102,"Comedy, Drama",2003, 70),
("Austin Powers: International Man of Mystery",89,"Adventure, Comedy",1997, 51),
("Austin Powers: The Spy Who Shagged Me",95,"Action, Adventure, Comedy",1999, 51),
("Austin Powers in Goldmember",94,"Action, Adventure, Comedy",2002, 51),
("Mamma Mia!",108,"Comedy, Musical, Romance",2008, 71),
("Whiplash",106,"Drama, Music",2014, 72),
("Jurassic Park",127,"Action, Adventure, Sci-Fi",1993, 73),
("Raiders of the Lost Arc",115,"Action, Adventure",1981, 74),
("The Trial of the Chicago 7",129,"Drama, History, Thriller",2020, 75),
("Little Miss Sunshine",101,"Comedy, Drama",2006, 76),
("American Psycho",102,"Crime, Drama, Horror",2000, 77),
("Little Women",135,"Drama, Romance",2019, 60),
("Django Unchained",165,"Drama, Western",2012, 78),
("Beetlejuice",92,"Comedy, Fantasy",1988, 21),
("Zombieland",88,"Action, Comedy, Horror",2009, 79),
("The Shining",146,"Drama, Horror",1980, 80),
("Dead Poets Society",128,"Comedy, Drama",1989, 2),
("Shiva Baby",77,"Comedy, Drama",2020, 81),
("Legally Blonde",96,"Comedy, Romance",2001, 82),
("The Hangover",100,"Comedy",2009, 83),
("The Breakfast Club",97,"Comedy, Drama",1985, 84),
("Freaky Friday",97,"Comedy, Family, Fantasy",2003, 85),
("Asteroid City",105,"Comedy, Drama, Romance",2023, 5),
("Dumb and Dumber",107,"Comedy",1994, 55),
("Alice in Wonderland",108,"Adventure, Family, Fantasy",2010, 21),
("Baby Driver",113,"Action, Crime, Drama",2017, 52),
("A Haunting in Venice",103,"Crime, Drama, Horror",2023, 86),
("Frankenweenie",87,"Animation, Comedy, Drama",2012, 21),
("Crazy Rich Asians",120,"Comedy, Drama, Romance",2018, 54),
("The Holdovers",133,"Comedy, Drama",2023, 87),
("Rye Lane",82,"Comedy, Drama, Romance",2023, 88),
("Inside Out",95,"Animation, Adventure, Comedy",2015, 89),
("Crazy, Stupid, Love",118,"Comedy, Drama, Romance",2011, 90),
("The Iron Claw",132,"Biography, Drama, Sport",2023, 91),
("Almost Famous",122,"Adventure, Comedy, Drama",2000, 92),
("Past Lives",105,"Drama, Romance",2023, 93),
("Saltburn",131,"Comedy, Drama, Thriller",2023, 68),
("Anatomy of a Fall",151,"Crime, Drama, Thriller",2023, 94),
("Hail, Caesar!",100,"Comedy, Music",1994, 10),
("Blackberry",120,"Biography, Comedy, Drama",2023, 95),
("Wedding Crashers",119,"Comedy, Romance",2005, 96),
("The Super Mario Bros. Movie",92,"Animation, Adventure, Comedy",2023, 97),
("Poor Things",141,"Comedy, Drama, Romance",2023, 98),
("Garden State",102,"Comedy, Drama, Romance",2004, 99),
("You Are So Not Invited To My Bat Mitzvah",103,"Comedy",2023, 100),
("Passages",91,"Drama, Romance",2023, 101),
("Holidate",104,"Comedy, Romance",2020, 102),
("Killers of the Flower Moon",206,"Crime, Drama, History",2023, 103),
("EXmas",93,"Comedy",2023, 104),
("Miracle",135,"Biography, Drama, History",2004, 105),
("Self Reliance",85,"Comedy, Thriller",2023, 106),
("Turning Red",100,"Animation, Adventure, Comedy",2022, 107),
("Come From Away",106,"Comedy, Drama, Musical",2021, 108),
("The Wrestler",109,"Drama, Sport",2008, 109),
("La La Land",128,"Comedy, Drama, Music",2016, 77),
("Cool Runnings",98,"Adventure, Comedy, Family",1993, 110),
("The Pianist",150,"Biography, Drama, Music",2002, 111),
("Office Space",89,"Comedy",1999, 112),
("The Boy and the Heron",124,"Animation, Adventure, Drama",2023, 8),
("How to Lose a Guy in 10 Days",116,"Comedy, Romance",2003, 113),
("Manchester by the Sea",137,"Drama",2016, 114),
("Anyone But You",103,"Comedy, Romance",2023, 115),
("Little Shop of Horrors",94,"Comedy, Horror, Musical",1986, 116),
("Lisa Frankenstein",101,"Comedy, Horror, Romance",2024, 117);

INSERT INTO movie (
title,
runtime,
genre,
release_year
) VALUES ("Seven Psychopaths",110,"Comedy, Crime",2012),
("Spider-Man: Across the Spider-Verse Pt 1",140,"Animation, Action, Adventure",2023),
("Sleepless In Seatle",105,"Comedy, Drama, Romance",1993);

INSERT INTO actor (
name,
birth_date
) VALUES 
("Margot Robbie","1990-07-02"),
("Paul Rudd","1969-04-06"),
("Emma Stone","1988-11-06"),
("Quentin Tarantino","1953-10-28");