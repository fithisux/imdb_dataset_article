{{ config(materialized='view') }}

with genres_data as (
    select 
    unnest(genres) as genre
    from {{ ref('title_basics_model_cleansed') }}
) select distinct(genre) as genre from genres_data