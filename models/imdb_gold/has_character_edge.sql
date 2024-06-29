{{ config(materialized='view') }}

select 
tconst || '_' || cast(ordering as string) as principal_id, 
unnest(characters) as somecharacter 
from {{ ref('title_principals_model_cleansed') }}