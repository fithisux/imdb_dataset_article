{{ config(materialized='view') }}

with source_data_title_crew as (

    select

    case when tconst='\N' then NULL else tconst end as tconst,
    case when directors='\N' then NULL else directors end as directors,
    case when writers='\N' then NULL else writers end as writers

    FROM {{ source('external_source', 'title.crew') }}

), corrected_for_emptiness_title_crew as (

    select

    cast(tconst as string) as tconst,
    case when directors is not null then regexp_split_to_array(directors, ',') else [] end as directors,
    case when writers is not null then regexp_split_to_array(writers, ',') else [] end as writers

    FROM source_data_title_crew

)

select * from corrected_for_emptiness_title_crew