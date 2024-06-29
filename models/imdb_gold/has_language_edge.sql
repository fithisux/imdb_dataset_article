{{ config(materialized='view') }}

select 
titleId || '_' || cast(ordering as string) as akas_id,
language as alpha2
from {{ ref('title_akas_model_cleansed') }}
where language is not null