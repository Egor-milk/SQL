/* 1. Создать таблицу exam с полями:

- идентификатора экзамена - автоинкрементируемый, уникальный, запрещает NULL;- наименования экзамена- даты экзамена */

DROP TABLE exam;

CREATE TABLE exam
(
	exam_id serial UNIQUE NOT NULL,
	exam_name varchar(64),
	exam_date date
);

-- 2. Удалить ограничение уникальности с поля идентификатора--

ALTER TABLE exam
DROP CONSTRAINT exam_exam_id_key;

-- 3. Добавить ограничение первичного ключа на поле идентификатора-- 

ALTER TABLE exam
ADD PRIMARY KEY(exam_id);

/* 4. Создать таблицу person с полями

- идентификатора личности 
(простой int, первичный ключ)- имя- фамилия */

DROP TABLE IF EXISTS person CASCADE;

CREATE TABLE person
(
	person_id int NOT NULL,
	first_name varchar(64) NOT NULL,
	last_name varchar (64) NOT NULL,
	CONSTRAINT pk_person_id PRIMARY KEY (person_id)
);

/* 5. Создать таблицу паспорта с полями:

- идентификатора паспорта (простой int, первичный ключ)- 
серийный номер (простой int, запрещает NULL)- 
регистрация- ссылка на идентификатор личности (внешний ключ) */

DROP TABLE IF EXISTS passport CASCADE;

CREATE TABLE pasport
(
	pasport_id int,
	serial_number int NOT NULL,
	registration text NOT NULL,
	person_id int NOT NULL,
	
	CONSTRAINT pk_passport_id PRIMARY KEY (pasport_id),
	CONSTRAINT fk_passport_person FOREIGN KEY (person_id) REFERENCES person(person_id)
)

/* 6. Добавить колонку веса в таблицу book (создавали ранее) 
с ограничением, проверяющим вес (больше 0 но меньше 100) */

ALTER TABLE book
ADD COLUMN weight decimal CONSTRAINT CHK_book_weight CHECK(weight > 0 AND weight < 100)


/* 7. Убедиться в том, что ограничение на вес работает (попробуйте вставить невалидное значение) */

INSERT INTO book (title, isbn, publisher_id, weight)
VALUES
('test', '123', 1, 101)

/* 8. Создать таблицу student с полями:

- идентификатора (автоинкремент)- полное имя- курс (по умолчанию 1) */

DROP TABLE IF EXISTS student CASCADE;

CREATE TABLE student
(
	student_id serial,
	full_name varchar(128),
	grade INT DEFAULT 1
);

/* 9. Вставить запись в таблицу студентов и убедиться,
что ограничение на вставку значения по умолчанию работает */

INSERT INTO student
VALUES
(1, 'vasia');

SELECT * FROM student

/* 10. Удалить ограничение "по умолчанию" из таблицы студентов */ 

ALTER TABLE student
ALTER COLUMN grade DROP DEFAULT

/* 11. Подключиться к БД northwind и добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0) */ 