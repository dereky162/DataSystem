/* Drop table as10_book_0nf */
DROP TABLE IF EXISTS as10_book_0nf;

/* Create table as10_book_0nf */
CREATE TABLE as10_book_0nf (
    isbn                VARCHAR(100) NOT NULL,
    title               VARCHAR(100) NOT NULL,
    author              VARCHAR(100) NOT NULL,
    author_nationality  VARCHAR(100) NOT NULL,
    format              VARCHAR(100) NOT NULL,
    price               NUMERIC(8,2) NOT NULL,
    subject             VARCHAR(100) NOT NULL,
    pages               INT          NOT NULL,
    thickness           VARCHAR(100) NOT NULL,
    publisher           VARCHAR(100) NOT NULL,
    publisher_country   VARCHAR(100) NOT NULL,
    genre_id            INT          NOT NULL,
    genre_name          VARCHAR(100) NOT NULL
);

/* Insert into table as10_book_0nf */
INSERT INTO as10_book_0nf
VALUES (
    '1590593324',
    'Beginning MySQL Database Design and Optimization',
    'Chad Russell',
    'American',
    'Hardcover',
    49.99,
    'MySQL Database Design',
    520,
    'Thick',
    'Apress',
    'USA',
    1,
    'Tutorial'
);

/* Retrieve all rows from table as10_book_0nf */
SELECT * FROM as10_book_0nf;

/* Drop table as10_book_1nf */
DROP TABLE IF EXISTS as10_book_1nf;

/* Create table as10_book_1nf */
CREATE TABLE as10_book_1nf (
    isbn                VARCHAR(100) NOT NULL,
    title               VARCHAR(100) NOT NULL,
    author              VARCHAR(100) NOT NULL,
    author_nationality  VARCHAR(100) NOT NULL,
    format              VARCHAR(100) NOT NULL,
    price               NUMERIC(8,2) NOT NULL,
    pages               INT          NOT NULL,
    thickness           VARCHAR(100) NOT NULL,
    publisher           VARCHAR(100) NOT NULL,
    publisher_country   VARCHAR(100) NOT NULL,
    genre_id            INT          NOT NULL,
    genre_name          VARCHAR(100) NOT NULL
);

/* Insert into table as10_book_1nf */
INSERT INTO as10_book_1nf
SELECT isbn, title, author, author_nationality, format, price, pages, thickness, publisher, publisher_country, genre_id, genre_name
FROM as10_book_0nf;

/* Retrieve all rows from table as10_book_1nf */
SELECT * FROM as10_book_1nf;

/* Drop table as10_subject_1nf */
DROP TABLE IF EXISTS as10_subject_1nf;

/* Create table as10_subject_1nf */
CREATE TABLE as10_subject_1nf (
    isbn    VARCHAR(100) NOT NULL,
    subject VARCHAR(100) NOT NULL
);

/* Insert into table as10_subject_1nf */
INSERT INTO as10_subject_1nf
VALUES ('1590593324', 'MySQL'),
       ('1590593324', 'Database'),
       ('1590593324', 'Design');

/* Retrieve all rows from table as10_subject_1nf */
SELECT * FROM as10_subject_1nf;

/* Drop table as10_book2_1nf */
DROP TABLE IF EXISTS as10_book2_1nf;

/* Create table as10_book2_1nf */
CREATE TABLE as10_book2_1nf (
    title               VARCHAR(100) NOT NULL,
    format              VARCHAR(100) NOT NULL,
    author              VARCHAR(100) NOT NULL,
    author_nationality  VARCHAR(100) NOT NULL,
    price               NUMERIC(8,2) NOT NULL,
    pages                        INT NOT NULL,
    thickness           VARCHAR(100) NOT NULL,
    publisher           VARCHAR(100) NOT NULL,
    publisher_country   VARCHAR(100) NOT NULL,
    genre_id                     INT NOT NULL,
    genre_name          VARCHAR(100) NOT NULL
);

/* Insert into table as10_book2_1nf */
INSERT INTO as10_book2_1nf
VALUES ('Beginning MySQL Database Design and Optimization', 'Hardcover', 'Chad Russell', 'American', 49.99, 520, 'Thick', 'Apress', 'USA', 1, 'Tutorial'),
       ('Beginning MySQL Database Design and Optimization', 'E-book', 'Chad Russell', 'American', 22.34, 520, 'Thick', 'Apress', 'USA', 1, 'Tutorial'),
       ('The Relational Model for Database Management: Version 2', 'E-book', 'E.F.Codd', 'British', 13.88, 538, 'Thick', 'Addison-Wesley', 'USA', 2, 'Popular science'),
       ('The Relational Model for Database Management: Version 2', 'Paperback', 'E.F.Codd', 'British', 39.99, 538, 'Thick', 'Addison-Wesley', 'USA', 2, 'Popular science');

/* Retrieve all rows from table as10_book2_1nf */
SELECT * FROM as10_book2_1nf;

/* Drop table as10_book2_2nf */
DROP TABLE IF EXISTS as10_book2_2nf;

/* Create table as10_book2_2nf */
CREATE TABLE as10_book2_2nf (
    title               VARCHAR(100) NOT NULL,
    author              VARCHAR(100) NOT NULL,
    author_nationality  VARCHAR(100) NOT NULL,
    pages               INT          NOT NULL,
    thickness           VARCHAR(100) NOT NULL,
    publisher           VARCHAR(100) NOT NULL,
    publisher_country   VARCHAR(100) NOT NULL,
    genre_id            INT          NOT NULL,
    genre_name          VARCHAR(100) NOT NULL
);

/* Insert into table as10_book2_2nf */
INSERT INTO as10_book2_2nf
SELECT title, author, author_nationality, pages, thickness, publisher, publisher_country, genre_id, genre_name
FROM as10_book2_1nf;

/* Retrieve all rows from table as10_book2_2nf */
SELECT * FROM as10_book2_2nf;

/* Drop table as10_price2_2nf */
DROP TABLE IF EXISTS as10_price2_2nf;

/* Create table as10_price2_2nf */
CREATE TABLE as10_price2_2nf (
    title   VARCHAR(100) NOT NULL,
    format  VARCHAR(100) NOT NULL,
    price   NUMERIC(8,2) NOT NULL
);

/* Insert into table as10_price2_2nf */
INSERT INTO as10_price2_2nf
SELECT title, format, price
FROM as10_book2_1nf;

/* Retrieve all rows from table as10_price2_2nf */
SELECT DISTINCT * FROM as10_price2_2nf;

/* Drop table as10_book_3nf */
DROP TABLE IF EXISTS as10_book_3nf;

/* Create table as10_book_3nf */
CREATE TABLE as10_book_3nf (
    title       VARCHAR(100) NOT NULL,
    author      VARCHAR(100) NOT NULL,
    pages       INT          NOT NULL,
    thickness   VARCHAR(100) NOT NULL,
    publisher   VARCHAR(100) NOT NULL,
    genre_id    INT          NOT NULL
);

/* Insert into table as10_book_3nf */
INSERT INTO as10_book_3nf
SELECT DISTINCT title, author, pages, thickness, publisher, genre_id
FROM as10_book2_1nf;

/* Retrieve all rows from table as10_book_3nf */
SELECT * FROM as10_book_3nf;

/* Drop table as10_price_3nf */
DROP TABLE IF EXISTS as10_price_3nf;

/* Create table as10_price_3nf */
CREATE TABLE as10_price_3nf (
    title   VARCHAR(100) NOT NULL,
    format  VARCHAR(100) NOT NULL,
    price   NUMERIC(8,2) NOT NULL
);

/* Insert into table as10_price_3nf */
INSERT INTO as10_price_3nf
SELECT title, format, price
FROM as10_book2_1nf;

/* Retrieve all rows from table as10_price_3nf */
SELECT * FROM as10_price_3nf;

/* Drop table as10_author_3nf */
DROP TABLE IF EXISTS as10_author_3nf;

/* Create table as10_author_3nf */
CREATE TABLE as10_author_3nf (
    author      VARCHAR(100) NOT NULL,
    nationality VARCHAR(100) NOT NULL
);

/* Insert into table as10_author_3nf */
INSERT INTO as10_author_3nf
SELECT author, author_nationality
FROM as10_book2_2nf;

/* Retrieve all rows from table as10_author_3nf */
SELECT DISTINCT * FROM as10_author_3nf;

/* Drop table as10_publisher_3nf */
DROP TABLE IF EXISTS as10_publisher_3nf;

/* Create table as10_publisher_3nf */
CREATE TABLE as10_publisher_3nf (
    publisher   VARCHAR(100) NOT NULL,
    country     VARCHAR(100) NOT NULL
);

/* Insert into table as10_publisher_3nf */
INSERT INTO as10_publisher_3nf
SELECT publisher, publisher_country
FROM as10_book2_2nf;

/* Retrieve all rows from table as10_publisher_3nf */
SELECT DISTINCT * FROM as10_publisher_3nf;

/* Drop table as10_genre_3nf */
DROP TABLE IF EXISTS as10_genre_3nf;

/* Create table as10_genre_3nf */
CREATE TABLE as10_genre_3nf (
    genre_id   VARCHAR(100) NOT NULL,
    name    VARCHAR(100) NOT NULL
);

/* Insert into table as10_genre_3nf */
INSERT INTO as10_genre_3nf
SELECT genre_id, genre_name
FROM as10_book2_2nf;

/* Retrieve all rows from table as10_genre_3nf */
SELECT DISTINCT * FROM as10_genre_3nf;