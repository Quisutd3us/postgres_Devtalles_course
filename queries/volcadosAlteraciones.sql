select *
from country;

insert into country_backup
(code,name,continent,region,surfacearea,indepyear,population,lifeexpectancy,gnp,gnpold,localname,governmentform,headofstate,capital,code2)
select *
from country;

alter table country
drop constraint if exists country_continent_check;

select a.name, a.continent,
(
    select b.code from continent b where b.name = a.continent
               )
from country a;

update country a
set continent=(select b.code from continent b where b.name = a.continent);

alter table country
alter column continent type integer
USING continent::integer;

alter table country
    add constraint fk_country_continent
        foreign key (continent) references continent (code)
            on delete cascade;

drop table if exists country_backup;