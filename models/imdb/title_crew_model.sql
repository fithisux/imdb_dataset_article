{{ config(materialized='view') }}

with source_data_title_crew as (

    select

    case when tconst='\N' then NULL else tconst end as tconst,
    case when directors='\N' then NULL else directors end as directors,
    case when writers='\N' then NULL else writers end as writers

    FROM {{ source('external_source', 'title.crew') }}

)

select * from source_data_title_crew