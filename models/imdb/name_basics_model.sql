{{ config(materialized='view') }}

with source_data_name_basics as (

    select

    case when nconst='\N' then NULL else nconst end as nconst,
    case when primaryName='\N' then NULL else primaryName end as primaryName,
    birthYear,
    deathYear,
    case when primaryProfession='\N' then NULL else primaryProfession end as primaryProfession,
    case when knownForTitles='\N' then NULL else knownForTitles end as knownForTitles
    
    FROM {{ source('external_source', 'name.basics') }}

)

select * from source_data_name_basics