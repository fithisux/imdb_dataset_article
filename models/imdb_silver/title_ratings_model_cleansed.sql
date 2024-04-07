{{ config(materialized='table') }}

select * from {{ref('title_ratings_model_casted')}}
where tconst in (select tconst from {{ref('title_basics_model_cleansed')}})