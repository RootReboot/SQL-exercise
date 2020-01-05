-- https://en.wikibooks.org/wiki/SQL_Exercises/Movie_theatres
-- 4.1 Select the title of all movies.
select
  title
from movies;
-- 4.2 Show all the distinct ratings in the database.
select
  distinct rating
from movies;
-- 4.3  Show all unrated movies.
select
  *
from movies
where
  rating is NULL;
-- 4.4 Select all movie theaters that are not currently showing a movie.
select
  *
from movieTheaters
where
  movie is NULL;
-- 4.5 Select all data from all movie theaters
  -- and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
SELECT
  *
FROM MovieTheaters
LEFT JOIN Movies ON MovieTheaters.Movie = Movies.Code;
-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
select
  *
from movieTheaters
left join movies on movies.code = movieTheaters.movie;
-- 4.7 Show the titles of movies not currently being shown in any theaters.
SELECT
  Movies.Title
FROM Movies
left JOIN MovieTheaters ON MovieTheaters.Movie = Movies.Code
WHERE
  MovieTheaters.Movie IS NULL;
-- 4.8 Add the unrated movie "One, Two, Three".
insert into Movies(Title, Rating)
values('One, Two, Three', NULL);
-- 4.9 Set the rating of all unrated movies to "G".
update movies
set
  rating = "G"
where
  rating is NULL;
-- 4.10 Remove movie theaters projecting movies rated "NC-17".
delete from movieTheaters
where
  movie in (
    select
      code
    from movies
    where
      rating = "NC-17"
  );