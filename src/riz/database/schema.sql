CREATE TABLE Authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(25) NOT NULL,
  last_name VARCHAR(25) NOT NULL
);

CREATE TABLE Game (
  id SERIAL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  label_id INT,
  source_id INT,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY (genre_id ) REFERENCES Genre(id),
  FOREIGN KEY (author_id) REFERENCES Authors(id),
  FOREIGN KEY (label_id) REFERENCES Label(id)
);