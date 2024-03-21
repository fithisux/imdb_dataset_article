{{ config(materialized='view') }}

select 
tconst,
titleType as title_type
from {{ ref('title_basics_model') }}