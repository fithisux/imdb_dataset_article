{{ config(materialized='view') }}

select
id as start_id,
category as end_id,
'IMDB_TITLE_PRINCIPALS' as start_vertex_type,
'IMDB_JOB_CATEGORY' as end_vertex_type,
from {{ ref('job_category_edge') }}