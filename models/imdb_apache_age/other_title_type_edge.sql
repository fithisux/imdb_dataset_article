{{ config(materialized='view') }}

select
tconst as start_id,
title_type as end_id,
'IMDB_TITLE_BASICS' as start_vertex_type,
'IMDB_TITLE_TYPE' as end_vertex_type,
from {{ ref('title_type_edge') }}