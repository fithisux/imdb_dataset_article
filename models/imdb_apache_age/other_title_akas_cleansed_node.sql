{{ config(materialized='view') }}

select
id,
ordering, 
title, 
isOriginalTitle 
from {{ ref('title_akas_cleansed_node') }}