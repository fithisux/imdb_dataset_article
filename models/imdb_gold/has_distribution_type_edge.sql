{{ config(materialized='view') }}

select 
titleId || '_' || cast(ordering as string) as akas_id,
unnest(types) as distribution_type
from {{ ref('title_akas_model_cleansed') }}