{{ config(materialized='view') }}

select
id as start_id,
alpha2 as end_id,
'IMDB_TITLE_AKAS' as start_vertex_type,
'IMDB_LANGUAGE_CODE' as end_vertex_type,
from {{ ref('language_edge') }}