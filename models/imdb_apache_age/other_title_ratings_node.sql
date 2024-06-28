{{ config(materialized='view') }}

select
ratetconst as id,
averageRating,
numVotes
from {{ ref('title_ratings_node') }}