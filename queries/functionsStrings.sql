--functions and String operators

select
    users.id,
    upper(users.name) as upper_name,
    lower(users.name) as lower_name,
    length(users.name) as LENGTH,
    (100 * 2) AS PERCENT,
    concat(users.id,' : ', users.name) as view,
    '*'|| users.id ||':' || users.name || '*' as BARCODE ,
    users.name
from users;