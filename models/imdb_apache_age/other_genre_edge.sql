{{ config(materialized='view') }}

select
tconst as start_id,
genre as end_id,
'IMDB_TITLE_BASICS' as start_vertex_type,
'IMDB_GENRE' as end_vertex_type,
from {{ ref('genre_edge') }}