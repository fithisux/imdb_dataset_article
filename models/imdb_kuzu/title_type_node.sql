{{ config(materialized='view') }}

select 
distinct(titleType) as title_type
from {{ ref('title_basics_model_cleansed') }}