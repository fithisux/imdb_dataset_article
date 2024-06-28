{{ config(materialized='view') }}

select
category as id,
from {{ ref('job_category_node') }}