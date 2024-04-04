{{ config(materialized='view') }}

select 
tconst || '_' || cast(ordering as string) as id, 
unnest(characters) as somecharacter 
from {{ ref('title_principals_model_cleansed') }}