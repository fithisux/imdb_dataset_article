{{ config(materialized='view') }}

with loaded_title_ratings as (

    select

    cast(tconst as string) as tconst,
    cast(averageRating as double) as averageRating,
    cast(numVotes as integer) as numVotes

    from {{ref('title_ratings_model')}}

)

select * from loaded_title_ratings