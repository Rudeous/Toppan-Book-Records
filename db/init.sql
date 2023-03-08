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
    "updatedAt" time with time zone NOT NULL,
    CONSTRAINT book_rents_pkey PRIMARY KEY (person_id, book_id),
    CONSTRAINT book_rents_book_id_fkey FOREIGN KEY (book_id)
        REFERENCES public.books (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT book_rents_person_id_fkey FOREIGN KEY (person_id)
        REFERENCES public.people (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- add sample countries
INSERT INTO country (full_name, country_code)
VALUES ('United States', 'US'),
       ('Canada', 'CA');

-- add sample people
INSERT INTO people (name, "createdAt", "updatedAt", country_id)
VALUES ('John Smith', NOW(), NOW(), 1),
       ('Jane Doe', NOW(), NOW(), 2);

-- add sample books
INSERT INTO books (name, "createdAt", "updatedAt")
VALUES ('The Great Gatsby', NOW(), NOW()),
       ('To Kill a Mockingbird', NOW(), NOW());

-- add sample authors
INSERT INTO authors (name, "createdAt", "updatedAt")
VALUES ('F. Scott Fitzgerald', NOW(), NOW()),
       ('Harper Lee', NOW(), NOW());

-- add sample author-book relationships
INSERT INTO author_books ("createdAt", "updatedAt", author_id, book_id)
VALUES (NOW(), NOW(), 1, 1),
       (NOW(), NOW(), 2, 2);

-- add sample book rentings
INSERT INTO book_rents (person_id, book_id, "createdAt", "updatedAt")
VALUES (1, 1, NOW(), NOW()),
       (2, 1, NOW(), NOW()),
       (1, 2, NOW(), NOW());