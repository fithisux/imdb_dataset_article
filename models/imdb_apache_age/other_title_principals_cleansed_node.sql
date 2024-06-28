{{ config(materialized='view') }}

select
id,
ordering,
job
from {{ ref('title_principals_cleansed_node') }}