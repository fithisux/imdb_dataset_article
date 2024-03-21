{{ config(materialized='view') }}

select
titleId || '_' || cast(ordering as string) as id, 
ordering, 
title, 
isOriginalTitle 
from {{ ref('title_akas_model_cleansed') }}