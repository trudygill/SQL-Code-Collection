-- created the initial table 
CREATE TABLE friends (
  id INTEGER,
  name TEXT,
  birthday DATE
); 

-- confirming that the table was created 
SELECT *
FROM friends; 

-- inserting records into the table 
INSERT INTO friends (id, name, birthday)
VALUES (1, 'Ororo Munroe', '1940-05-30');

INSERT INTO friends (id, name, birthday)
VALUES (2, 'Trish Michelle', '1998-01-14'); 

INSERT INTO friends (id, name, birthday)
VALUES (3, 'Simon Plenty', '2001-12-15');

-- confirming again that the records were addded 
SELECT *
FROM friends; 

-- updating one record in the table 
UPDATE friends
SET name = 'Storm'
WHERE id = 2;

-- adding a column to the table
ALTER TABLE friends
ADD email TEXT;

-- confirming that the column was adde 
SELECT *
FROM friends; 

-- inserting data into the previously added column 
UPDATE friends
SET email = 'storm@codecademy.com'
WHERE id = 1;

UPDATE friends
SET email = 'trish@codecademy.com'
WHERE id = 2;

UPDATE friends
SET email = 'simon@codecademy.com'
WHERE id = 3; 

-- deleting a record from the table 
DELETE FROM friends
WHERE name = 'Storm';

-- confirming that the record was deleted 
SELECT *
FROM friends; 
