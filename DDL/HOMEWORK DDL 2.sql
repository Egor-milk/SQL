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
