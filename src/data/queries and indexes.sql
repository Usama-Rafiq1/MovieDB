	CREATE TABLE directors (
    movie_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL,
    FOREIGN KEY(movie_id) REFERENCES movies(id),
    FOREIGN KEY(person_id) REFERENCES people(id)
);

CREATE TABLE movies (
    id INTEGER,
    title TEXT NOT NULL,
    year NUMERIC,
    PRIMARY KEY(id)
);

CREATE TABLE people (
    id INTEGER,
    name TEXT NOT NULL,
    birth NUMERIC,
    PRIMARY KEY(id)
);

CREATE TABLE ratings (
    movie_id INTEGER NOT NULL,
    rating REAL NOT NULL,
    votes INTEGER NOT NULL,
    FOREIGN KEY(movie_id) REFERENCES movies(id)
);

CREATE TABLE stars (
    movie_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL,
    FOREIGN KEY(movie_id) REFERENCES movies(id),
    FOREIGN KEY(person_id) REFERENCES people(id)
);


CREATE INDEX idx_movies_year ON movies(year);
CREATE INDEX idx_ratings_movie_id ON ratings(movie_id);
CREATE INDEX idx_stars_movie_id ON stars(movie_id);
CREATE INDEX idx_stars_person_id ON stars(person_id);
CREATE INDEX idx_movies_year_votes ON movies(year, id);

SELECT movies.id, people.id, people.name AS Actor, movies.title, movies.year
FROM movies
JOIN stars ON movies.id = stars.movie_id
JOIN people ON stars.person_id = people.id
JOIN ratings ON ratings.movie_id = movies.id
WHERE movies.title LIKE 'John Wick%';

SELECT movies.id, people.id, people.name AS Actor, movies.title, movies.year
FROM movies
JOIN stars ON movies.id = stars.movie_id
JOIN people ON stars.person_id = people.id
JOIN ratings ON ratings.movie_id = movies.id
WHERE ratings.votes > 10000 AND movies.year > 2010
ORDER BY movies.year DESC LIMIT 100;

