{{ config(materialized='view') }}

select
id as start_id,
somecharacter as end_id,
'IMDB_TITLE_PRINCIPALS' as start_vertex_type,
'IMDB_CHARACTERS' as end_vertex_type,
from {{ ref('characters_edge') }}