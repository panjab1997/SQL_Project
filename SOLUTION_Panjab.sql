# Create database Movie_data;
use Movie_data;
# Alter table momovie rename to movie;
select* from movie;

# Q.1 Write a SQL query to find when the movie 'American Beauty' released. Return movie release year.
select mov_year
from movie
where mov_title = 'American Beauty';

# Q.2 Write a SQL query to find those movies, which were released before 1998. Return movie title.

SELECT mov_title
FROM movie
WHERE mov_year < 1998;

# Q3. Write a query where it should contain all the data of the movies which were 
-- released after 1995 and their movie duration was greater than 120.
SELECT * 
FROM movie
WHERE mov_year > 1995 AND mov_time > 120;

# Q4. Write a query to determine the Top 7 movies which were released in United 
-- Kingdom. Sort the data in ascending order of the movie year.
SELECT * 
FROM movie 
where mov_rel_country = "UK"
order by mov_year asc 
limit 7;

# Q.5 Set the language of movie language as 'Chinese' for the movie which has its 
-- existing language as Japanese and the movie year was 2001.

update movie set mov_lang = 'Chinese' WHERE mov_lang = 'Japanese' AND mov_year = 2001;
Select* from movie 
Where mov_lang = "Japanese";

# Q.6 Write a SQL query to find name of all the reviewers who rated the movie 
-- 'Slumdog Millionaire'.
 SELECT re.rev_name FROM (select* 
 FROM Movie m
Join ratings r using(mov_id)) s
join reviewer re using(rev_id)
WHERE mov_title = 'Slumdog Millionaire' ;

# Q.7 Write a query which fetch the first name, last name & role played by the 
-- actor where output should all exclude Male actors.

SELECT act_fname as First_Name, act_lname as Last_Name, role as Role_Played 
FROM actor a 
JOIN cast c using(act_id)
WHERE act_gender != 'M';

# Q.8 Write a SQL query to find the actors who played a role in the movie 'Annie Hall'.
-- Fetch all the fields of actor table. (Hint: Use the IN operator).

SELECT CONCAT(a.act_fname, ' ', a.act_lname ) as Name
FROM (SELECT* 
FROM movie m 
JOIN cast c using(mov_id)) mc
RIGHT JOIN actor a using(act_id)
WHERE mov_title = 'Annie Hall';

# Q.9 Write a SQL query to find those movies that have been released in countries other 
-- than the United Kingdom. Return movie title, movie year, movie time, and date of 
-- release, releasing country.

SELECT mov_title, mov_year, mov_time, mov_dt_rel, mov_rel_country
FROM movie
WHERE mov_rel_country = 'UK';


# Q.10 Print genre title, maximum movie duration and the count the number of 
-- movies in each genre. (HINT: By using inner join)
SELECT gen_title, MAX(mov_time) as MAX_dur, count(*) as count_g FROM (SELECT* 
FROM genres g
JOIN movie_genres mv using(gen_id)) ge
Join movie m using(mov_id)
group by gen_title;

# Q.11 Create a view which should contain the first name, last name, title of the movie & role played by particular actor.

Create View Movie_time as (SELECT a.act_fname, a.act_lname, m.mov_title, c.role  FROM cast c JOIN actor a using(act_id) 
JOIN movie m using(mov_id));
SELECT * FROM Movie_time;

# Q.12 Write a SQL query to find the movies with the lowest ratings
SELECT mov_title 
FROM movie m 
JOIN ratings r using(mov_id)
ORDER BY rev_stars asc
LIMIT 1;
