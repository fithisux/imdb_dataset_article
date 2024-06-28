{{ config(materialized='view') }}

select
tconst as start_id,
ratetconst as end_id,
'IMDB_TITLE_BASICS' as start_vertex_type,
'IMDB_TITLE_RATINGS' as end_vertex_type,
from {{ ref('rate_edge') }}