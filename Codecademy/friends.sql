CREATE TABLE friends (
  id INTEGER,
  name TEXT,
  birthday DATE
); 

-- SELECT *
-- FROM friends; 

INSERT INTO friends (id, name, birthday)
VALUES (1, 'Ororo Munroe', '1940-05-30');

-- SELECT *
-- FROM friends; 

INSERT INTO friends (id, name, birthday)
VALUES (2, 'Trish Michelle', '1998-01-14'); 

INSERT INTO friends (id, name, birthday)
VALUES (3, 'Simon Plenty', '2001-12-15');

-- SELECT *
-- FROM friends; 

UPDATE friends
SET name = 'Storm'
WHERE id = 2;

-- SELECT *
-- FROM friends; 


ALTER TABLE friends
ADD email TEXT;

-- SELECT *
-- FROM friends; 

UPDATE friends
SET email = 'storm@codecademy.com'
WHERE id = 1;

UPDATE friends
SET email = 'trish@codecademy.com'
WHERE id = 2;

UPDATE friends
SET email = 'simon@codecademy.com'
WHERE id = 3; 

SELECT *
FROM friends; 

DELETE FROM friends
WHERE name = 'Storm';

SELECT *
FROM friends; 
