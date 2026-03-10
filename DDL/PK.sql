CREATE TABLE chair
(
	chair_id serial PRIMARY KEY,
	chair_name varchar,
	dean varchar
);

INSERT INTO chair
VALUES (1, 'name', 'dean')

SELECT * FROM chair

INSERT INTO chair -- нельзя вставить из за --
VALUES (1, 'asdas', 'sadasd')--ограничения уникальности--
--PK--

DROP TABLE chair;
CREATE TABLE chair
(
	chair_id serial UNIQUE NOT NULL, -- почти как PK--
	chair_name varchar,
	dean varchar
);

SELECT constraint_name
FROM information_schema.key_column_usage
WHERE table_name = 'chair'

ALTER TABLE chair
ADD PRIMARY KEY(chair_id)

