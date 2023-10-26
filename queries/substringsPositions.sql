select
    name as FULL_NAME,
    substring(name, 0, position(' ' in users.name)) as FIRST_NAME,
    trim(substring(name, position(' ' in users.name),length(users.name))) as LAST_NAME
from users;

--NOTE: important don't include blank spaces in results added to new columns