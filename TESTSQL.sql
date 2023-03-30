CREATE DATABASE record_company;
USE record_company;
CREATE TABLE band (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE albums (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
    release_year INT,
    band_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES band(id)
);




INSERT INTO band(name)
VALUES ('Iron Maiden');

INSERT INTO band(name)
VALUES ('The Exploited'), ('Dead Kennedys'), ('Abergaz');


SELECT * FROM band;

SELECT * FROM band LIMIT 2;

SELECT name FROM band;

SELECT id AS 'ID', name AS 'BAND NAME'
FROM band;


SELECT * FROM band ORDER BY name;

INSERT INTO albums (name, release_year, band_id)
VALUES ('The Number of the Beast', 1982, 1),
	   ('Powerslave', 1984, 1),
       ('Sivoslavija', 2022, 4),
       ('Punks not dead', 1981, 2),
       ('Fresh fruit for rotting vegetables', NULL, 3);

SELECT * FROM albums;

SELECT DISTINCT name FROM albums;

UPDATE albums
SET release_year = 1980
WHERE id = 5;

SELECT * FROM albums
WHERE release_year < 2000;

SELECT * FROM band
WHERE name LIKE '%er%';

SELECT * FROM albums
WHERE release_year = 1984 AND band_id = 1;

SELECT * FROM albums
WHERE release_year BETWEEN 1984 AND 2023;


DELETE FROM albums WHERE id = 5;

SELECT * FROM albums;

SELECT * FROM band
INNER JOIN albums ON band.id = albums.band_id;

SELECT * FROM band
LEFT JOIN albums ON band.id = albums.band_id;

SELECT * FROM band
RIGHT JOIN albums ON band.id = albums.band_id;

SELECT AVG(release_year) FROM albums;
SELECT SUM(release_year) FROM albums;

SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;


SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM band AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id
HAVING num_albums = 1;
