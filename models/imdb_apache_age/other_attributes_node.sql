{{ config(materialized='view') }}

select
attribute as id,
from {{ ref('attributes_node') }}