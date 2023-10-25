

-- 1. Ver todos los registros

select * from users;


-- 2. Ver el registro cuyo id sea igual a 10
select * 
from users
where id='10';

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)

select * 
from users
where users.name like 'Jim %';


-- 4. Todos los registros cuyo segundo nombre es Alexander
select *
from users
where users.name like '% Alexander';

-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
update users
set name= 'david nariño'
where users.id = 1;


-- 6. Borrar el último registro de la tabla
with vars as (
    select
        (select max(id) from users) as maximo
)
select *
from users,vars
where users.id=vars.maximo;
