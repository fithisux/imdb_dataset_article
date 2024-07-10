{{ config(materialized='table') }}

SELECT 
    tconst,
    list_sort(t2.writers) as writers,
    list_sort(t3.directors) as directors
from {{ref('title_crew_model_casted')}} t,
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
where tconst in (select tconst from {{ref('title_basics_model_cleansed')}})