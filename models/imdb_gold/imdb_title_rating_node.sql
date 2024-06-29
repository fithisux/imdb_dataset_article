{{ config(materialized='view') }}

select
tconst as ratetconst,
averageRating,
numVotes
from {{ ref('title_ratings_model_cleansed') }}