CREATE TABLE IF NOT EXISTS books (
    book_id SERIAL NOT NULL,
    author text,
    name text,
    publisher text,
    year SMALLINT,
    primary key(book_id, publisher)
)
PARTITION BY LIST (publisher);

--CREATE INDEX books_publisher_idx ON books (publisher);

CREATE TABLE books_vikhola PARTITION OF books FOR VALUES IN ('Vikhola');
CREATE TABLE books_folio PARTITION OF books FOR VALUES IN ('Folio');
CREATE TABLE books_default PARTITION OF books DEFAULT;