{{ config(materialized='view') }}

select 
tconst || '_' || cast(ordering as string) as principal_id,
category
from {{ ref('title_principals_model_cleansed') }}