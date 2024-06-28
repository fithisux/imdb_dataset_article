{{ config(materialized='view') }}

select
genre as id,
from {{ ref('genre_node') }}