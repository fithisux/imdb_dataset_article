{{ config(materialized='view') }}

with source_data_title_episode as (

    select

    case when tconst='\N' then NULL else tconst end as tconst,
    case when parentTconst='\N' then NULL else parentTconst end as parentTconst,
    case when seasonNumber='\N' then NULL else seasonNumber end as seasonNumber,
    case when episodeNumber='\N' then NULL else episodeNumber end as episodeNumber,

    FROM {{ source('external_source', 'title.episode') }}

)

select * from source_data_title_episode