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
where followers = 4
   or followers = 4999
group by followers;

select count(*) as total_persons, followers
from users
where followers between 4500 and 4999
group by followers
order by followers desc;

select count(*) as total, country
from users
group by country
having count(*) between 1 and 4
order by count(*) desc;


-- distinct (don't exist duplicate registers)

select distinct country
from users;

select count(*)                                                 as total,
       substring(users.email, position('@' in users.email) + 1) as domain,
       'david'                                                  as name,
       37                                                       as age
from users
group by substring(users.email, position('@' in users.email) + 1)
having count(*) > 1
order by count(*) desc;

--using sub-queries

select
    sum(total)
from (select count(*)                                                 as total,
             substring(users.email, position('@' in users.email) + 1) as domain,
             'david'                                                  as name,
             37                                                       as age
      from users
      group by substring(users.email, position('@' in users.email) + 1)
      having count(*) > 1
      order by count(*) desc) as email_domains;


select *
from users;