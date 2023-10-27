select *
from country;

--create country_backup table
    create table public.country_backup
(
    code           char(3) not null
        primary key,
    name           text    not null,
    continent      text    not null
        constraint country_continent_check
            check ((continent = 'Asia'::text) OR (continent = 'South America'::text) OR
                   (continent = 'North America'::text) OR (continent = 'Oceania'::text) OR
                   (continent = 'Antarctica'::text) OR (continent = 'Africa'::text) OR (continent = 'Europe'::text) OR
                   (continent = 'Central America'::text)),
    region         text    not null,
    surfacearea    real    not null
        constraint country_surfacearea_check
            check (surfacearea >= (0)::double precision),
    indepyear      smallint,
    population     integer not null,
    lifeexpectancy real,
    gnp            numeric(10, 2),
    gnpold         numeric(10, 2),
    localname      text    not null,
    governmentform text    not null,
    headofstate    text,
    capital        integer,
    code2          char(2) not null
);

--population country_backup table from country table

insert into country_backup
select *
from country;

--drop constraint because the column type is text end we need insert integers
alter table country
    drop constraint if exists country_continent_check;

--create continent table
    create table continent
(
    code serial
        constraint continent_pk
            primary key,
    name text not null
);

--populate continent table
select distinct continent from country order by continent asc;

insert into continent (name)
select distinct continent from country order by continent asc;

-- creando vista antes de cambiar la tabla country para revisar campos origen y destino
select a.name,
       a.continent,
       (select b.name
        from continent b
        where b.name = a.continent)
from country a;

update country a
set continent=(select b.code from continent b where b.name = a.continent);

--casting country.continent to integer , is necessary for create fk successfully

alter table country
    alter column continent type integer
        USING continent::integer;
-- creating fk country.continent (n) to continent.code (1)

alter table country
    add constraint fk_country_continent
        foreign key (continent) references continent (code)
            on delete cascade;

--delete country_backup table
drop table if exists country_backup;

select *
from countrylanguage;


--creating new table language

select *
from countrylanguage_Backup;

create sequence if not exists language_code_seq;

create table language
(
    code integer default nextval('language_code_seq'::regclass) not null
        constraint language_pk
            primary key,
    name text                                                   not null
);

--backup table countrylanguage

create table public.countrylanguage_Backup
(
    countrycode char(3) not null
        references public.country
            on delete cascade,
    language    text    not null,
    isofficial  boolean not null,
    percentage  real    not null
        constraint countrylanguage_percentage_check
            check ((percentage >= (0)::double precision) AND (percentage <= (100)::double precision)),
    primary key (countrycode, language)
);

alter table public.countrylanguage
    owner to alumno;

--populate countrylanguage_backup table

insert into countrylanguage_Backup
select *
from countrylanguage;

--add new column to countrylanguage
alter table countrylanguage
    add column if not exists languagecode varchar(3);

--populate language table

insert into language
    (name)
select language
from countrylanguage;

--develop the view before populate new column

select language,
       (select name from language b where a.language = b.name)
from countrylanguage a;

select language from countrylanguage;
select name from language;



update countrylanguage a
set countrycode = (select name from language b where a.language = b.name);
