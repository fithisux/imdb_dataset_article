{{ config(materialized='view') }}
select 
tconst,
parentTconst as tconst
from {{ ref('title_episode_model') }}