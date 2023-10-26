select count(*)
from city;
select count(*)
from country;
select count(*)
from countrylanguage;

alter table country
    add primary key (code);

delete
from country
where code2 = 'NA'
  and name = 'Netherlands';

alter table country
    add check (
        surfacearea >= 0
        );

alter table country
    add check (
            continent in ('Central America','Asia', 'South America', 'North America', 'Oceania', 'Antarctica', 'Africa', 'Europe')
        );

alter table if exists country
    drop constraint if exists country_continent_check;

select distinct continent
from country;

update country
set
    continent= 'Central America'
where continent='North America' and region='Central America';

select *
from country
where continent='Central America';




