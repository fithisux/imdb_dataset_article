{{ config(materialized='view') }}

select
nconst,
unnest(primaryProfession) as profession 
from {{ ref('name_basics_model_cleansed') }}