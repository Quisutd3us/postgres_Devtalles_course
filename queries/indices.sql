select *
from city
where district like 'J%';

create unique index "unique_country_name" on country (name);
create index "country_continent" on country(continent);

create unique index "unique_name_countrycode_district"
    on city (name,countrycode,district);

create index "district_city"
    on city(district);

