{{ config(materialized='view') }}

select 
tconst,
tconst
from {{ ref('title_ratings_model') }}