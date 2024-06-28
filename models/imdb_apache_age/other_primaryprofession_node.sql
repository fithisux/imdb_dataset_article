{{ config(materialized='view') }}

select
profession as id,
from {{ ref('primaryprofession_node') }}