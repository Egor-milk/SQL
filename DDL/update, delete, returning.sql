SELECT * FROM author

UPDATE author
SET full_name = 'BOWB', rating = 5
WHERE author_id = 11

DELETE FROM author
WHERE rating < 11

DElETE FROM author

TRUNCATE TABLE author

CREATE TABLE public.book
(
    book_id serial,
    title text NOT NULL,
    isbn varchar(32) NOT NULL,
    publisher_id int NOT NULL,
	  
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

INSERT INTO book (title, isbn, publisher_id)
VALUES ('title', 'isbn', 3)
RETURNING *

UPDATE author
SET full_name = 'Walter', rating = 5
WHERE author_id = 1
RETURNING *