select
  mov_title
from
  movies m,director d
where
  m.dir_id=d.dir_id and 
  d.dir_name="'Hitchcock";



select distinct
  mov_title
from
  movies m, movie_cast mc
where
  m.mov_id = mc.mov_id and (
    select
      count(mov_id) 
    from 
      movie_cast 
    where 
      act_id = mc.act_id) >= 2;



select
  act_name
from
  actor a join movie_cast mc on a.act_id = mc.act_id join movies m on mc.mov_id = m.mov_id 
where
  m.mov_year < 2000

Intersect

select
  act_name 
from
  actor a join movie_cast mc on a.act_id = mc.act_id join movies m on mc.mov_id = m.mov_id 
where
  m.mov_year>2015;



select
  mov_title,max(rev_stars) 
from
  movies m, rating r
where
  m.mov_id = r.mov_id
group by
  m.mov_title,m.mov_id
order by
  m.mov_title;



update
  rating
set
  rev_stars=5
where
  mov_id in (
    select m.mov_id 
    from movies m,director d 
    where m.dir_id = d.dir_id and d.dir_name="Steven Spielberg"
  );
