create table books(
title varchar(50) , 
user_id  int auto_increment primary key , 
os varchar(50),
listen_hours decimal(5,2), 
listen_percent int,
 is_test varchar(50)
 );
INSERT INTO books (title, user_id, os, listen_hours, listen_percent, is_test) VALUES
    ('Coraline', 1, 'Android', 2.5, 100, FALSE),
    ('Coraline', 2, 'iOS', 1.2, 50, FALSE),
    ('Coraline', 3, 'Android', 0.8, 15, FALSE),
    ('Coraline', 4, 'iOS', 3.0, 100, TRUE), -- тестовое прослушивание
    ('Harry Potter', 5, 'Android', 5.0, 100, FALSE),
    ('Harry Potter', 6, 'iOS', 2.0, 40, FALSE),
    ('Harry Potter', 7, 'Android', 4.5, 90, FALSE),
    ('Harry Potter', 8, 'Android', 1.0, 20, FALSE),
    ('The Hobbit', 9, 'iOS', 6.0, 100, FALSE),
    ('The Hobbit', 10, 'Android', 1.5, 25, FALSE),
    ('The Hobbit', 11, 'iOS', 2.5, 50, TRUE), -- тестовое прослушивание
    ('The Hobbit', 12, 'Android', 3.5, 70, FALSE),
    ('The Hobbit', 13, 'iOS', 4.0, 100, FALSE),
    ('The Catcher in the Rye', 14, 'iOS', 3.0, 60, FALSE),
    ('The Catcher in the Rye', 15, 'Android', 2.0, 100, FALSE),
    ('The Catcher in the Rye', 16, 'iOS', 1.5, 30, FALSE);
select 
count(distinct user_id) as count_user,
count(distinct case when listen_percent >10 then user_id end) as count_percent
from books
where title = 'Coraline';
select os, title,
count(distinct user_id) as count_user,
SUM(listen_hours) AS total_listen_hours
from books
where is_test = false
group by os, title;
select title, count(user_id) as count_user
from books
group by title
order by count_user desc
limit 1;
select title, count(*) as listen_count
from books
where listen_percent = 100
group by title
order by listen_count desc
limit 1;