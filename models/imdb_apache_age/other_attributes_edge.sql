{{ config(materialized='view') }}

select
id as start_id,
attribute as end_id,
'IMDB_TITLE_AKAS' as start_vertex_type,
'IMDB_ATTRIBUTES' as end_vertex_type,
from {{ ref('attributes_edge') }}