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
from {{ref('name_basics_model_casted')}} t,
LATERAL (select flatten(array_agg(xxx)) from (
    SELECT [knownForTitle] as xxx
    from (select unnest(t.knownForTitles) as knownForTitle)
    where knownForTitle in (select tconst from {{ref('title_basics_model_cleansed')}})
    UNION ALL 
    SELECT [] as xxx
)) t2(knownForTitles)
where primaryName is not NULL
and birthYear is not NULL
and birthYear >= 1000 
and birthYear <= 9999
and ( (deathYear is null) or ( (deathYear is not null) and (deathYear >= 1000 ) and (deathYear <= 9999)))
and ( (deathYear is null) or (birthYear is null)  or ( (deathYear is not null) and (birthYear is not null) and (deathYear > birthYear)))