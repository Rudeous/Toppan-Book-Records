DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA IF NOT EXISTS public;



-- create the country table sequence
CREATE SEQUENCE IF NOT EXISTS country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
-- this is the country table
CREATE TABLE IF NOT EXISTS country
(
    id bigint NOT NULL DEFAULT nextval('country_id_seq'::regclass),
    full_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    country_code character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT country_pkey PRIMARY KEY (id)
);

-- create the people table sequence
CREATE SEQUENCE IF NOT EXISTS people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
--this is the people table
CREATE TABLE IF NOT EXISTS people
(
    id integer NOT NULL DEFAULT nextval('people_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    country_id bigint,
    CONSTRAINT people_pkey PRIMARY KEY (id),
    CONSTRAINT people_country_id_fkey FOREIGN KEY (country_id)
        REFERENCES public.country (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- create the book table sequence
CREATE SEQUENCE IF NOT EXISTS books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
--this is the book table
CREATE TABLE IF NOT EXISTS books
(
    id integer NOT NULL DEFAULT nextval('books_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    CONSTRAINT books_pkey PRIMARY KEY (id)
);


-- create the author table sequence
CREATE SEQUENCE IF NOT EXISTS authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
-- this is the author table
CREATE TABLE IF NOT EXISTS authors
(
    id integer NOT NULL DEFAULT nextval('authors_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    CONSTRAINT authors_pkey PRIMARY KEY (id)
);


-- this is the author and book multi to multi relationship table
CREATE TABLE IF NOT EXISTS author_books
(
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    author_id integer NOT NULL,
    book_id integer NOT NULL,
    CONSTRAINT author_books_pkey PRIMARY KEY (author_id, book_id),
    CONSTRAINT author_books_author_id_fkey FOREIGN KEY (author_id)
        REFERENCES public.authors (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT author_books_book_id_fkey FOREIGN KEY (book_id)
        REFERENCES public.books (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


--this is the book renting history table
CREATE TABLE IF NOT EXISTS book_rents
(
    person_id bigint NOT NULL,
    book_id bigint NOT NULL,
    "createdAt" time with time zone NOT NULL,
    "updatedAt" time with time zone NOT NULL
);

-- add sample countries
INSERT INTO country (full_name, country_code)
VALUES  ('Singapore', 'SG'),
        ('Malaysia', 'MY'),
        ('United States', 'US'),
        ('Canada', 'CA'),
        ('United Kingdom', 'UK'),
        ('France', 'FR'),
        ('Germany', 'DE');
        

-- add sample people with reasonable timestamps
INSERT INTO people (name, "createdAt", "updatedAt", country_id)
VALUES  ('John Smith', '2016-01-01 00:00:00', '2016-01-01 00:00:00', 1),
        ('Jane Smith', '2016-01-01 00:00:00', '2016-01-01 00:00:00', 1),
        ('John Doe', '2016-01-01 00:00:00', '2016-01-01 00:00:00', 1),
        ('Jane Doe', '2016-01-01 00:00:00', '2016-01-01 00:00:00', 1),
        ('John Brown', '2016-01-01 00:00:00', '2016-01-01 00:00:00', 1),
        ('Jane Brown', '2016-01-01 00:00:00', '2016-01-01 00:00:00', 1),
        ('John Doe', '2016-01-01 00:00:00', '2016-01-01 00:00:00', 1),
        ('Jane Doe', '2016-01-01 00:00:00', '2016-01-01 00:00:00', 1),
        ('John Black', '2016-01-01 00:00:00', '2016-01-01 00:00:00', 2),
        ('Jane Black', '2016-01-01 00:00:00', '2016-01-01 00:00:00', 3),
        ('John White', '2016-01-01 00:00:00', '2016-01-01 00:00:00', 4),
        ('Jane White', '2016-01-01 00:00:00', '2016-01-01 00:00:00', 5),
        ('John Grey', '2016-01-01 00:00:00', '2016-01-01 00:00:00', 6),
        ('Jane Grey', '2016-01-01 00:00:00', '2016-01-01 00:00:00', 7);

-- add sample real books -> reasonable timestamps instead of local time
INSERT INTO books (name, "createdAt", "updatedAt")
VALUES  ('The Great Gatsby', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        ('To Kill a Mockingbird', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        ('Pride and Prejudice', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        ('The Lord of the Rings', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        ('The Raven', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        ('Harry Potter and the Philosopher''s Stone', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        ('The Hitchhiker''s Guide to the Galaxy', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        ('The Lion, the Witch and the Wardrobe', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        ('The Da Vinci Code', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        ('The Catcher in the Rye', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        ('The Little Prince', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        ('The Alchemist', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        ('The Kite Runner', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        ('The Fault in Our Stars', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        ('The Book Thief', '2016-01-01 00:00:00', '2016-01-01 00:00:00');

-- add corresponding authors for books above
INSERT INTO authors (name, "createdAt", "updatedAt")
VALUES ('F. Scott Fitzgerald', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
       ('Harper Lee', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
       ('Jane Austen', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
       ('J. R. R. Tolkien', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
       ('William Shakespeare', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
       ('J. K. Rowling', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
       ('Douglas Adams', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
       ('C. S. Lewis', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
       ('Dan Brown', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
       ('J. D. Salinger', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
       ('Antoine de Saint-Exupéry', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
       ('Paulo Coelho', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
       ('Khaled Hosseini', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
       ('John Green', '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
       ('Markus Zusak', '2016-01-01 00:00:00', '2016-01-01 00:00:00');


-- add sample author-book relationships
INSERT INTO author_books ("createdAt", "updatedAt", author_id, book_id)
VALUES  ('2016-01-01 00:00:00', '2016-01-01 00:00:00', 1, 1),
        ('2016-01-01 00:00:00', '2016-01-01 00:00:00', 2, 2),
        ('2016-01-01 00:00:00', '2016-01-01 00:00:00', 3, 3),
        ('2016-01-01 00:00:00', '2016-01-01 00:00:00', 4, 4),
        ('2016-01-01 00:00:00', '2016-01-01 00:00:00', 5, 5),
        ('2016-01-01 00:00:00', '2016-01-01 00:00:00', 6, 6),
        ('2016-01-01 00:00:00', '2016-01-01 00:00:00', 7, 7),
        ('2016-01-01 00:00:00', '2016-01-01 00:00:00', 8, 8),
        ('2016-01-01 00:00:00', '2016-01-01 00:00:00', 9, 9),
        ('2016-01-01 00:00:00', '2016-01-01 00:00:00', 10, 10),
        ('2016-01-01 00:00:00', '2016-01-01 00:00:00', 11, 11),
        ('2016-01-01 00:00:00', '2016-01-01 00:00:00', 12, 12),
        ('2016-01-01 00:00:00', '2016-01-01 00:00:00', 13, 13),
        ('2016-01-01 00:00:00', '2016-01-01 00:00:00', 14, 14),
        ('2016-01-01 00:00:00', '2016-01-01 00:00:00', 15, 15);

-- add sample book rentings with random numbers of people renting different books at different times to make it easier for queries
INSERT INTO book_rents (person_id, book_id, "createdAt", "updatedAt")
VALUES  (1, 1, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (1, 1, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
        (1, 1, '2018-01-01 00:00:00', '2018-01-01 00:00:00'),
        (2, 2, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (2, 2, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
        (4, 3, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (3, 4, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (4, 4, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (5, 5, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (6, 5, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (5, 6, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (6, 6, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (7, 7, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (8, 7, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (7, 8, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (8, 8, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (9, 9, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (10, 9, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (9, 10, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (10, 10, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (11, 11, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (12, 11, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (11, 12, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (12, 12, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (13, 13, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (14, 13, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (13, 14, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (14, 14, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (15, 15, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (1, 15, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (15, 1, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (1, 9, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (2, 9, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (3, 9, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (4, 9, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (3, 1, '2016-01-01 00:00:00', '2016-01-01 00:00:00'),
        (2, 15, '2016-01-01 00:00:00', '2016-01-01 00:00:00');