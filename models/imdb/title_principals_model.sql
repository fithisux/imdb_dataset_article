{{ config(materialized='view') }}

with source_data_title_principals as (

    select

    case when tconst='\N' then NULL else tconst end as tconst,
    case when ordering='\N' then NULL else ordering end as ordering,
    case when nconst='\N' then NULL else nconst end as nconst,
    case when category='\N' then NULL else category end as category,
    case when characters='\N' then NULL else characters end as characters,
    case when job='\N' then NULL else job end as job

    FROM {{ source('external_source', 'title.principals') }}

)

select * from source_data_title_principals