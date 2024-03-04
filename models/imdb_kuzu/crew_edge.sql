{{ config(materialized='view') }}

select 
tconst,
tconst
from {{ ref('title_crew_model_cleansed') }}