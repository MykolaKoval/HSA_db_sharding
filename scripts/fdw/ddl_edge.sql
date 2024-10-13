CREATE TABLE IF NOT EXISTS books (
    book_id SERIAL NOT NULL,
    author text,
    name text,
    publisher text,
    year SMALLINT
)
PARTITION BY LIST (publisher);

-- Configure remote shards
CREATE EXTENSION postgres_fdw;

CREATE SERVER pg_books_vikhola
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'pg-sh1', port '5432', dbname 'test_db');
CREATE USER MAPPING FOR user
    SERVER pg_books_vikhola
    OPTIONS (user 'user', password 'secret');
CREATE FOREIGN TABLE remote_books_vikhola PARTITION OF books FOR VALUES IN ('Vikhola')
    SERVER pg_books_vikhola
    OPTIONS (schema_name 'public', table_name 'books');

CREATE SERVER pg_books_folio
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'pg-sh2', port '5432', dbname 'test_db');
CREATE USER MAPPING FOR user
    SERVER pg_books_folio
    OPTIONS (user 'user', password 'secret');
CREATE FOREIGN TABLE remote_books_folio PARTITION OF books FOR VALUES IN ('Folio')
    SERVER pg_books_folio
    OPTIONS (schema_name 'public', table_name 'books');

CREATE SERVER pg_books_default
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'pg-sh3', port '5432', dbname 'test_db');
CREATE USER MAPPING FOR user
    SERVER pg_books_default
    OPTIONS (user 'user', password 'secret');
CREATE FOREIGN TABLE remote_books_default PARTITION OF books DEFAULT
    SERVER pg_books_default
    OPTIONS (schema_name 'public', table_name 'books');