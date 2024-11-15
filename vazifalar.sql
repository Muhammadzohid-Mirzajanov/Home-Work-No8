-- 1. authors jadvali
create table authors (
    id serial primary key,
    name text not null,
    birth_date date,
    country text
);

-- 2. publishers jadvali
create table publishers (
    id serial primary key,
    name text not null,
    city text,
    established_year int
);

-- 3. books jadvali
create table books (
    id serial primary key,
    title text not null,
    author_id int not null,
    publisher_id int not null,
    genre text,
    publish_date date,
    price numeric check (price > 0),
    foreign key (author_id) references authors(id) on delete cascade,
    foreign key (publisher_id) references publishers(id) on delete cascade
);

-- 4. book_reviews jadvali
create table book_reviews (
    id serial primary key,
    book_id int not null,
    review_text text,
    rating int check (rating between 1 and 5),
    review_date date,
    foreign key (book_id) references books(id) on delete cascade
);
-- authors jadvaliga ma'lumot qo'shish
insert into authors (name, birth_date, country) values
('Muallif1', '1975-01-01', 'USA'),
('Muallif2', '1980-03-15', 'UK'),
('Muallif3', '1990-07-20', 'Canada'),
('Muallif4', '1985-11-11', 'India'),
('Muallif5', '2000-05-25', 'Australia');

-- publishers jadvaliga ma'lumot qo'shish
insert into publishers (name, city, established_year) values
('Nashriyot1', 'Toshkent', 1995),
('Nashriyot2', 'London', 2005),
('Nashriyot3', 'New York', 2010),
('Nashriyot4', 'Delhi', 2012),
('Nashriyot5', 'Sydney', 2018);

-- books jadvaliga ma'lumot qo'shish
insert into books (title, author_id, publisher_id, genre, publish_date, price) values
('Kitob1', 1, 1, 'Fantastika', '2020-01-01', 15.99),
('Kitob2', 2, 2, 'Roman', '2018-03-15', 12.50),
('Kitob3', 3, 3, 'Dramma', '2019-07-20', 9.99),
('Kitob4', 4, 4, 'Ilmiy', '2021-11-11', 20.00),
('Kitob5', 5, 5, 'Tarix', '2022-05-25', 17.75),
('Kitob6', 1, 2, 'Fantastika', '2020-09-01', 14.99),
('Kitob7', 2, 3, 'Roman', '2017-04-15', 11.50),
('Kitob8', 3, 4, 'Dramma', '2021-02-20', 8.99),
('Kitob9', 4, 5, 'Ilmiy', '2023-06-11', 22.00),
('Kitob10', 5, 1, 'Tarix', '2020-08-25', 18.50);

-- book_reviews jadvaliga ma'lumot qo'shish
insert into book_reviews (book_id, review_text, rating, review_date) values
(1, 'Juda yaxshi kitob!', 5, '2021-01-10'),
(2, 'Yaxshi yozilgan', 4, '2020-03-20'),
(3, 'Ortacha darajada', 3, '2019-06-15'),
(4, 'Ajoyib ilmiy kitob', 5, '2022-09-05'),
(5, 'Tarixiy malumotlarga boy', 4, '2023-02-10');

-- 1. select
select * from authors;

-- 2. column aliases
select name as muallif, country as mamlakat from authors;

-- 3. order by
select * from books order by price desc;

-- 4. where
select * from books where genre = 'Fantastika';

-- 5. limit
select * from books limit 3;

-- 6. in
select * from books where genre in ('Roman', 'Dramma');

-- 7. between
select * from books where price between 10 and 20;

-- 8. like
select * from books where title like 'Kitob%';

-- 9. is null
select * from book_reviews where review_text is null;

-- 10. group by
select genre, count(*) as kitoblar_soni from books group by genre;

-- join
select books.title, authors.name, publishers.name as nashriyot from books
join authors on books.author_id = authors.id
join publishers on books.publisher_id = publishers.id;

-- aggregate funksiyalar
select count(*) as kitob_soni, avg(price) as ortacha_narx, sum(price) as jami_narx from books;

