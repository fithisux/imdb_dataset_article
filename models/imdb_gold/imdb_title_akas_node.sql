{{ config(materialized='view') }}

select
titleId || '_' || cast(ordering as string) as akas_id, 
titleId,
cast(ordering as int) as ordering, 
title, 
isOriginalTitle 
from {{ ref('title_akas_model_cleansed') }}