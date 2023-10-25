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
    regexp_split_to_array(coalesce(directors, ''), '\x02') as directors,
    regexp_split_to_array(coalesce(writers, ''), '\x02') as writers,

    FROM source_data_title_crew

)

select * from corrected_for_emptiness_title_crew