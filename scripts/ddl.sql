CREATE TABLE IF NOT EXISTS books (
    book_id SERIAL PRIMARY KEY,
    author text,
    name text,
    publisher text,
    year SMALLINT
);

--CREATE INDEX books_publisher_idx ON books (publisher);