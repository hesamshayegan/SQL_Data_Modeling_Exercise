-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space



CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

  CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_star_id INTEGER REFERENCES stars ON DELETE CASCADE,
  galaxy_id INTEGER REFERENCES galaxies ON DELETE CASCADE
  
);

  CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INTEGER REFERENCES planets ON DELETE CASCADE
  );

INSERT INTO stars (name) 
VALUES 
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO galaxies (name)
VALUES
('Milky Way');



INSERT INTO planets (name, orbital_period_in_years,  orbits_around_star_id, galaxy_id)
VALUES
('Earth', 1.00, 1, 1),
('Mars', 1.88, 1, 1),
('Venus', 0.62, 1 , 1),
('Neptune', 164.8, 1, 1),
('Proxima Centauri b', 0.03, 2, 1),
('Gliese 876 b', 0.23, 3  , 1);  

INSERT INTO moons (name, planet_id)
VALUES
('Phobos', 1), 
('Deimos', 1),
('Naiad', 3),
('Thalassa', 3),
('Despina', 3),
('Galatea', 3),
('Larissa', 3),
('S/2004 N 1', 3),
('Proteus', 3), 
('Triton', 3),
('Nereid', 3),
('Halimede', 3),
('Sao', 3),
('Laomedeia', 3),
('Psamathe', 3),
('Neso', 3);