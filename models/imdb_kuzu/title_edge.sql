{{ config(materialized='view') }}

select 
tconst as epitconst,
tconst,
from {{ ref('title_episode_model') }}