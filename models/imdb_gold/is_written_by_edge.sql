{{ config(materialized='view') }}

select 
tconst,
unnest(writers) as nconst
from {{ ref('title_crew_model_cleansed') }}