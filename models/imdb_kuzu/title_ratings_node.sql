{{ config(materialized='view') }}

select
tconst,
averageRating,
numVotes
from {{ ref('title_ratings_model') }}