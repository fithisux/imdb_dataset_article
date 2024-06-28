{{ config(materialized='view') }}

select
nconst as start_id,
tconst as end_id,
'IMDB_NAME_BASICS' as start_vertex_type,
'IMDB_TITLE_BASICS' as end_vertex_type,
from {{ ref('knownfor_edge') }}