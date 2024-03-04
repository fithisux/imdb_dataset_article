{{ config(materialized='view') }}

select 
tconst,
unnest(directors) as nconst
from {{ ref('title_crew_model_cleansed') }}