{{ config(materialized='view') }}

select
nconst as start_id,
profession as end_id,
'IMDB_NAME_BASICS' as start_vertex_type,
'IMDB_PRIMARYPROFESSION' as end_vertex_type,
from {{ ref('primaryprofession_edge') }}