{{ config(materialized='view') }}

-- select 
-- tconst,
-- list_filter(writers, x -> x <> 'nm2007716') as writers,
-- list_filter(directors, x -> x <> 'nm12428300') as directors
-- from {{ref('title_crew_model')}}


with exploded_crew as (
    select  tconst, unnest(writers) as writer, unnest(directors) as director from {{ref('title_crew_model')}}
)
select tconst, array_agg(writer) as writers, array_agg(director) as directors from exploded_crew
where TRUE
and writer in (select nconst from {{ref('name_basics_model')}})
and director in (select nconst from {{ref('name_basics_model')}})
group by tconst