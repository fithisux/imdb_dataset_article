{{ config(materialized='view') }}

select
tconst,
seasonNumber,
episodeNumber
from {{ ref('title_episode_model') }}