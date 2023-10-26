select *
from country
where code='AFG';

INSERT INTO country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');

alter table city
    add constraint "fk_country_code"
    foreign key (countrycode)
    references country(code); --on delete cascade

alter table countrylanguage
    add constraint "fk_countrylanguage_country"
        foreign key (countrycode)
            references country(code);