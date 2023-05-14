CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(128) NOT NULL,
    release_date DATE
);
CREATE UNIQUE INDEX movies_title_idx ON movies(title);

CREATE TABLE characters (
    id SERIAL PRIMARY KEY,
    firstn VARCHAR(64) NOT NULL,
    lastn VARCHAR(64),
    movie_id INT,
    age INT,
    birthday DATE,
    CONSTRAINT fk_characters_movies_id
      FOREIGN KEY(movie_id) REFERENCES movies(id)

);
CREATE UNIQUE INDEX characters_firstn_idx ON characters(firstn);
