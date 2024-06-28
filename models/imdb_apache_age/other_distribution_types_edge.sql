{{ config(materialized='view') }}

select
id as start_id,
distribution_type as end_id,
'IMDB_TITLE_AKAS' as start_vertex_type,
'IMDB_DISTRIBUTION_TYPE' as end_vertex_type,
from {{ ref('distribution_types_edge') }}