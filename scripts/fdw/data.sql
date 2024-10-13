do $$
begin
raise notice 'Start data insertion!';
for i in 1..500000 loop
INSERT INTO books (author, name, publisher, year)
VALUES
    ('Valerian Pidmohylyny', 'Місто', 'Vikhola', 2022),
    ('Viktor Domontovych', 'Без грунту', 'Vikhola', 2023);

  if i <= 100000 then
     INSERT INTO books (author, name, publisher, year) VALUES ('Mykola Khvylovy', 'Я (Романтика)', 'Folio', 2021);
  end if;

  if i <= 1000 then
       INSERT INTO books (author, name, publisher, year)
       VALUES
            ('Viktor Domontovych', 'Дівчина з ведемедиком', 'Komora', 2019),
            ('Yuriy Yanovky', 'Майстер корабля', 'Znannia', 2020);
  end if;
end loop;
raise notice 'Completed data insertion!';
end;
$$;