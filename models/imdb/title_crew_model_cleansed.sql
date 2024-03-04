{{ config(materialized='table') }}

-- select 
-- tconst,
-- list_filter(writers, x -> x <> 'nm2007716') as writers,
-- list_filter(directors, x -> x <> 'nm12428300') as directors
-- from {{ref('title_crew_model')}}


SELECT 
    tconst,
    t.writers as writersOLD,
    t.directors as directorsOLD,
    t2.writers as writers,
    t3.directors as directors
from {{ref('title_crew_model')}} t,
LATERAL (
select flatten(array_agg(xxx1)) from (
	    SELECT [writer] as xxx1
	    from (select unnest(t.writers) as writer)
	    where writer in (select nconst from {{ref('name_basics_model_cleansed')}})
	    UNION ALL 
	    SELECT [] as xxx1
	)
) t2(writers),  
LATERAL (
select flatten(array_agg(xxx2)) from (
	    SELECT [director] as xxx2
	    from (select unnest(t.directors) as director)
	    where director in (select nconst from {{ref('name_basics_model_cleansed')}})
	    UNION ALL 
	    SELECT [] as xxx2
	)
) t3(directors)