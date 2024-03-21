{{ config(materialized='view') }}

select 
titleId || '_' || cast(ordering as string) as id,
titleId as tconst
from {{ ref('title_akas_model_cleansed') }}