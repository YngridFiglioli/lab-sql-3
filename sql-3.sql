#1.How many distinct (different) actors' last names are there?
#2.In how many different languages where the films originally produced? (Use the column language_id from the film table)
#3.How many movies were released with "PG-13" rating?
#4.Get 10 the longest movies from 2006.
#5.How many days has been the company operating (check DATEDIFF() function)?
#6.Show rental info with additional columns month and weekday. Get 20.
#7.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
#9.How many rentals were in the last month of activity?

use sakila;

select count(distinct(last_name)) as count_last_name from actor;

select count(distinct(language_id)) as count_language from language;

select count(*) as 'pg-13' from film where rating = 'PG-13';

select title, length from film where release_year = '2006' order by length desc limit 10;

#select max(datediff(last_update) as days_operating from store;

 select *, extract(month from rental_date) as rental_month, extract(day from rental_date) as rental_day
 from rental limit 20;
 
 select *, 
    (case
        when WEEKDAY(rental_date) < 5 then 'workday'
        else 'weekend'
    end) as day_type
from rental;

select count(rental_id) from rental
where date(rental_date) between date("2006-01-15") and date("2006-02-14");
