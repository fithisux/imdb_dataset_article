{{ config(materialized='view') }}

select
nconst,
unnest(knownForTitles) as tconst 
from {{ ref('name_basics_model_cleansed') }}