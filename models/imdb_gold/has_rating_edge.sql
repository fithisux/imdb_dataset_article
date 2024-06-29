{{ config(materialized='view') }}

select 
tconst,
tconst as ratetconst
from {{ ref('title_ratings_model_cleansed') }}