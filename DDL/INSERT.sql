INSERT INTO author
VALUES (10, 'John Silver', 4.5)

SELECT * FROM author

INSERT INTO author (author_id, full_name)
VALUES 
(11, 'bob'),
(12, 'vsa'),
(123, 'sad')

SELECT *
INTO best_authors
FROM author
WHERE rating >= 4.5

SELECT * FROM best_authors

INSERT INTO best_authors
SELECT *
FROM author
WHERE rating < 4.5