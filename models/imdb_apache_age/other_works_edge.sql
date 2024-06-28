{{ config(materialized='view') }}

select
id as start_id,
tconst as end_id,
'IMDB_TITLE_PRINCIPALS' as start_vertex_type,
'IMDB_TITLE_BASICS' as end_vertex_type,
from {{ ref('works_edge') }}