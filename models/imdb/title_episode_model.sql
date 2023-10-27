{{ config(materialized='view') }}

with source_data_title_episode as (

    select

    case when tconst='\N' then NULL else tconst end as tconst,
    case when parentTconst='\N' then NULL else parentTconst end as parentTconst,
    case when seasonNumber='\N' then NULL else seasonNumber end as seasonNumber,
    case when episodeNumber='\N' then NULL else episodeNumber end as episodeNumber,

    FROM {{ source('external_source', 'title.episode') }}

), corrected_for_emptiness_title_episode as (

    select

    cast(tconst as string) as tconst,
    cast(parentTconst as string) as parentTconst,
    cast(seasonNumber as integer) as seasonNumber,
    cast(episodeNumber as integer) as episodeNumber
    

    FROM source_data_title_episode

)

select * from corrected_for_emptiness_title_episode