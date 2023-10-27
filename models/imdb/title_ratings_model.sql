{{ config(materialized='view') }}

with source_data_title_ratings as (

    select

    cast(tconst as string) as tconst,
    cast(averageRating as double) as averageRating,
    cast(numVotes as integer) as numVotes

    FROM {{ source('external_source', 'title.ratings') }}

)

select * from source_data_title_ratings