CREATE TABLE IF NOT EXISTS books (
    book_id SERIAL NOT NULL,
    author text,
    name text,
    publisher text,
    year SMALLINT,
    primary key(book_id, publisher)
);