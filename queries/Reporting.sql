--between

select first_name,
       last_name,
       followers
from users
where
    -- followers >= 4600 and followers <= 4700
    followers between 4600 and 4700
order by followers desc;

--count, min , max , avg , rounded, sum
select count(*)                                      as total_users,
       min(users.followers)                          as min_followers,
       max(users.followers)                          as max_followers,
       avg(users.followers)                          as avg_followers,
       round(avg(users.followers))                   as avg_followers_rounded,
       sum(users.followers) / count(users.followers) as avg_manual
from users;


--group-by

select count(*) as total_persons, followers
from users
where followers= 4 or followers=4999
group by followers;

select count(*) as total_persons, followers
from users
where followers between 4500 and 4999
group by followers
order by followers desc ;


select *
from users;