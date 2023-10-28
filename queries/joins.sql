--union
select name,code from continent where name like '%America'
union
select name,code from continent where code in (1,5)
order by name asc;

--inner join

select * from continent;

select a.name as country , b.name as continent from country a
inner join continent b on b.code = a.continent
order by  a.name asc;

