{{ config(materialized='view') }}

select
tconst as epitconst,
seasonNumber,
episodeNumber
from {{ ref('title_episode_model_cleansed') }}