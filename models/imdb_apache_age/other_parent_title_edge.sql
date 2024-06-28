{{ config(materialized='view') }}

select
epitconst as start_id,
tconst as end_id,
'IMDB_TITLE_EPISODE' as start_vertex_type,
'IMDB_TITLE_BASICS' as end_vertex_type,
from {{ ref('parent_title_edge') }}