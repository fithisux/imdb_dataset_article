{{ config(materialized='view') }}

select 
tconst || '_' || cast(ordering as string) as id,
nconst
from {{ ref('title_principals_model_cleansed') }}