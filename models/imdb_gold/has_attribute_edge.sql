{{ config(materialized='view') }}

select
titleId || '_' || cast(ordering as string) as akas_id,
unnest(attributes) as attribute 
from {{ ref('title_akas_model_cleansed') }}