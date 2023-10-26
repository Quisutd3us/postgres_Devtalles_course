select
    id,
    name,
    first_name,
    last_name,
    substring(users.name,0, position(' ' in users.name))
from users;
select * from users;

select
    substring(users.name, 0, position(' ' in users.name)) as first_name,
    substring(users.name,position(' ' in users.name)+1,length(users.name)) as last_name
from users;

update
    users
set
    first_name = substring(users.name, 0, position(' ' in users.name)) ,
    last_name= substring(users.name,position(' ' in users.name)+1,length(users.name));

select * from users;