
{{ config(materialized='view') }}

select
tconst as start_id,
nconst as end_id,
'IMDB_TITLE_BASICS' as start_vertex_type,
'IMDB_NAME_BASICS' as end_vertex_type,
from {{ ref('writers_edge') }}