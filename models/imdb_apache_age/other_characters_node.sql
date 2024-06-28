{{ config(materialized='view') }}

select
somecharacter as id,
from {{ ref('characters_node') }}