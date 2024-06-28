{{ config(materialized='view') }}

select
epitconst as id,
seasonNumber,
episodeNumber
from {{ ref('title_episode_node') }}