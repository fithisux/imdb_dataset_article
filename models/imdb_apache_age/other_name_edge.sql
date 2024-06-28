{{ config(materialized='view') }}

select
id as start_id,
nconst as end_id,
'IMDB_TITLE_PRINCIPALS' as start_vertex_type,
'IMDB_NAME_BASICS' as end_vertex_type,
from {{ ref('name_edge') }}