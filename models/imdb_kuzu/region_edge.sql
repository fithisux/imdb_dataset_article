{{ config(materialized='view') }}

select 
titleId || '_' || cast(ordering as string) as id, 
region as alpha2
from {{ ref('title_akas_model_cleansed') }}
where region is not null