{{ config(materialized='view') }}
select 
tconst as epitconst,
parentTconst as tconst
from {{ ref('title_episode_model_cleansed') }}