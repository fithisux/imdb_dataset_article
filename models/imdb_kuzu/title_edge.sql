{{ config(materialized='view') }}

select 
tconst,
tconst,
from {{ ref('title_episode_model') }}