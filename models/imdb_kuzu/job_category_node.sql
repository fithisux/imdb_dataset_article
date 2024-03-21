{{ config(materialized='view') }}

select 
distinct(category) as category
from {{ ref('title_principals_model_cleansed') }}