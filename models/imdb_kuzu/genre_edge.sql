{{ config(materialized='view') }}

select 
tconst,
unnest(genres) as genre
from {{ ref('title_basics_model_cleansed') }}