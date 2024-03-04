{{ config(materialized='table') }}

-- select 
-- tconst,
-- list_filter(writers, x -> x <> 'nm2007716') as writers,
-- list_filter(directors, x -> x <> 'nm12428300') as directors
-- from {{ref('title_crew_model')}}

SELECT 
    nconst,
    primaryName,
    birthYear,
    deathYear,
    primaryProfession,
    t2.knownForTitles as knownForTitles
from {{ref('name_basics_model')}} t,
LATERAL (select flatten(array_agg(xxx)) from (
    SELECT [knownForTitle] as xxx
    from (select unnest(t.knownForTitles) as knownForTitle)
    where knownForTitle in (select tconst from title_basics_model)
    UNION ALL 
    SELECT [] as xxx
)) t2(knownForTitles)