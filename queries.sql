-- SQL query to return the total number of movies for each genre
CREATE TABLE query1 AS 
SELECT genres.name, COUNT(hasagenre.genreid) as moviecount 
FROM genres LEFT JOIN hasagenre ON genres.genreid = hasagenre.genreid
GROUP BY genres.genreid;

-- SQL query to return the average rating per genre
CREATE TABLE query2 AS 
SELECT genres.name, AVG(ratings.rating) AS rating 
FROM genres LEFT JOIN hasagenre ON genres.genreid = hasagenre.genreid LEFT JOIN ratings ON hasagenre.movieid = ratings.movieid 
GROUP BY genres.genreid;

-- SQL query to return the movies have at least 10 ratings.
CREATE TABLE query3 AS 
SELECT movies.title, COUNT(ratings.rating) AS countofratings 
FROM movies LEFT JOIN ratings ON movies.movieid = ratings.movieid 
GROUP BY movies.movieid 
HAVING COUNT(movies.movieid) >= 10;

-- SQL query to return all “Comedy” movies, including movieid and title.
CREATE TABLE query4 AS 
SELECT movies.movieid, movies.title 
FROM movies LEFT JOIN hasagenre ON movies.movieid = hasagenre.movieid LEFT JOIN genres ON hasagenre.genreid = genres.genreid
WHERE genres.name = 'Comedy';

-- SQL query to return the average rating per movie.
CREATE TABLE query5 AS 
SELECT movies.title, AVG(ratings.rating) AS average 
FROM movies LEFT JOIN ratings ON movies.movieid = ratings.movieid 
GROUP BY movies.movieid;

-- SQL query to return the average rating for all “Comedy” movies.
CREATE TABLE query6 AS 
SELECT AVG(ratings.rating) AS average 
FROM genres LEFT JOIN hasagenre ON genres.genreid = hasagenre.genreid LEFT JOIN ratings ON hasagenre.movieid = ratings.movieid 
WHERE genres.name = 'Comedy';

CREATE TABLE cmdy AS
SELECT movies.movieid 
FROM movies LEFT JOIN hasagenre ON movies.movieid = hasagenre.movieid LEFT JOIN genres ON hasagenre.genreid = genres.genreid 
WHERE genres.name = 'Comedy';

CREATE TABLE rmnc AS
SELECT movies.movieid 
FROM movies LEFT JOIN hasagenre ON movies.movieid = hasagenre.movieid LEFT JOIN genres ON hasagenre.genreid = genres.genreid 
WHERE genres.name = 'Romance';

-- SQL query to return the average rating for all movies and each of these movies is both “Comedy” and “Romance”
CREATE TABLE query7 AS 
SELECT AVG(ratings.rating) AS average 
FROM ratings 
WHERE ratings.movieid IN (SELECT cmdy.movieid FROM cmdy INNER JOIN rmnc ON cmdy.movieid = rmnc.movieid);

-- SQL query to return the average rating for all movies and each of these movies is “Romance” but not “Comedy”
CREATE TABLE query8 AS
SELECT AVG(ratings.rating) AS average 
FROM ratings
WHERE ratings.movieid IN (SELECT rmnc.movieid FROM rmnc WHERE rmnc.movieid NOT IN (SELECT cmdy.movieid FROM cmdy));

-- Find all movies that are rated by a User such that the userId is equal to v1. The v1 will be an integer parameter passed to the SQL query.
CREATE TABLE query9 AS
SELECT ratings.movieid, ratings.rating
FROM ratings
WHERE ratings.userid = :v1;















