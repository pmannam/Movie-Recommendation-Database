DROP TABLE IF EXISTS users;
CREATE TABLE users (
   userid INT PRIMARY KEY NOT NULL,
   name TEXT NOT NULL
);

DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
   movieid INT PRIMARY KEY NOT NULL,
   title TEXT NOT NULL
);

DROP TABLE IF EXISTS taginfo;
CREATE TABLE taginfo (
   tagid INT PRIMARY KEY NOT NULL,
   content TEXT NOT NULL
);

DROP TABLE IF EXISTS genres;
CREATE TABLE genres (
   genreid INT PRIMARY KEY NOT NULL,
   name TEXT NOT NULL
);

DROP TABLE IF EXISTS ratings;
CREATE TABLE ratings (
   userid INT REFERENCES users(userid),
   movieid INT REFERENCES movies(movieid),
   rating NUMERIC NOT NULL CHECK(rating>=0 AND rating<=5),
   timestamp BIGINT NOT NULL,
   PRIMARY KEY (userid, movieid)
);

DROP TABLE IF EXISTS tags;
CREATE TABLE tags (
   userid INT REFERENCES users(userid),
   movieid INT REFERENCES movies(movieid),
   tagid INT REFERENCES taginfo(tagid),
   timestamp BIGINT NOT NULL,
   PRIMARY KEY (userid, movieid, tagid)
);

DROP TABLE IF EXISTS hasagenre;
CREATE TABLE hasagenre (
   movieid INT REFERENCES movies(movieid),
   genreid INT REFERENCES genres(genreid),
   PRIMARY KEY (movieid, genreid)   
);
