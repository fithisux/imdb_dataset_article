{{ config(materialized='view') }}

select 
nconst, 
primaryName, 
birthYear, 
deathYear 
from {{ ref('name_basics_model_cleansed') }}