--union
select name, code
from continent
where name like '%America'
union
select name, code
from continent
where code in (1, 5)
order by name asc;

--inner join
select a.name as country, b.name as continent
from country a
         inner join continent b on b.code = a.continent
order by a.name asc;

select A.name, B.name
from country A
         inner join continent B
                    on A.continent = B.code
where B.name in ('South America', 'North Asia');

--restart sequence

alter sequence continent_code_seq restart with 8;

--insert rows in continent table

insert into public.continent (name)
values ('South Asia');


select *
from continent;

--full outer join

select A.name as CityName, A.continent as continentCode, B.name as continentName
from country A
         full outer join continent B
                         on B.code = A.continent
order by a.name desc;


--RIGHT OUTER JOIN
SELECT distinct B.NAME
FROM country A
         RIGHT JOIN continent B
                    ON A.continent = B.code
WHERE A.continent IS NULL
ORDER BY B.name asc;

--AGGREGATIONS

select count(*) as total, B.name
from country A
         INNER JOIN continent B
                    on A.continent = B.code
GROUP BY A.continent, B.name
order by count(*) desc;


--COUNT UNION

(select count(*) as total, B.name
from country A
         inner join continent B
                    ON A.continent = B.code
where b.name not in ('Central America', 'South America', 'North America')
group by B.name
union
select count(*)  as total,'America'
from country A
         inner join continent B
                    ON A.continent = B.code
where b.name in ('Central America', 'South America', 'North America'))
order by total asc;

