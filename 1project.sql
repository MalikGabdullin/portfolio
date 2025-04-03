select distinct user_id
from users
where date between '2023-11-07' and  '2023-11-15';
select user_id, sum(view_adverts) as total_user
from users
group by user_id
order by total_user desc
limit 1;
select date, avg(view_adverts) as avg_date
from users
group by date
having(count(distinct user_id)) > 500
order by avg_date
limit 1;
select user_id, sum(view_adverts) as LT
from users
group by user_id
order by LT desc;
select user_id, avg(view_adverts) as avg_total
from users 
group by user_id
HAVING COUNT(DISTINCT date) >= 5
order by avg_total desc
limit 1;