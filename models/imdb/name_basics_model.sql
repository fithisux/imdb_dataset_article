{{ config(materialized='view') }}

with source_data_name_basics as (

    select

    case when nconst='\N' then NULL else nconst end as nconst,
    case when primaryName='\N' then NULL else primaryName end as primaryName,
    case when birthYear='\N' then NULL else birthYear end as birthYear,
    case when deathYear='\N' then NULL else deathYear end as deathYear,
    case when primaryProfession='\N' then NULL else primaryProfession end as primaryProfession,
    case when knownForTitles='\N' then NULL else knownForTitles end as knownForTitles
    
    FROM {{ source('external_source', 'name.basics') }}

), corrected_for_emptiness_name_basics as (

    select

    cast(nconst as string) as nconst,
    cast(primaryName as string) as primaryName,
    cast(birthYear as string) as birthYear,
    cast(deathYear as string) as deathYear,
    regexp_split_to_array(coalesce(primaryProfession, ''), ',') as primaryProfession,
    regexp_split_to_array(coalesce(knownForTitles, '') , ',') as knownForTitles

    from source_data_name_basics
)

select * from corrected_for_emptiness_name_basics