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

), corrected_for_emptiness_title_principals as (

    select

    cast(tconst as string) as tconst,
    cast(ordering as integer) as ordering,
    cast(nconst as string) as nconst,
    cast(category as string) as category,
    cast(job as string) as job,
    case when characters is not null then  list_transform(cast(characters as string[]), x -> replace(replace(x , '\"', chr(39)),'"', '')) else [] end as characters

    FROM source_data_title_principals

)

select * from corrected_for_emptiness_title_principals