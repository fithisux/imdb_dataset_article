{{ config(materialized='view') }}

with source_data_name_basics as (

    select

    case when nconst='\N' then NULL else nconst end as nconst,
    case when primaryName='\N' then NULL else primaryName end as primaryName,
    case when regexp_full_match(birthYear,'[1-9]\d\d\d') then birthYear else NULL end as birthYear,
    case when regexp_full_match(deathYear,'[1-9]\d\d\d') then deathYear else NULL end as deathYear,
    case when primaryProfession='\N' then NULL else primaryProfession end as primaryProfession,
    case when knownForTitles='\N' then NULL else knownForTitles end as knownForTitles
    
    FROM {{ source('external_source', 'name.basics') }}

), corrected_for_emptiness_name_basics as (

    select

    cast(nconst as string) as nconst,
    cast(primaryName as string) as primaryName,
    cast(birthYear as integer) as birthYear,
    cast(deathYear as integer) as deathYear,
    case when primaryProfession is not null then regexp_split_to_array(primaryProfession, ',') else [] end as primaryProfession,
    case when knownForTitles is not null then regexp_split_to_array(knownForTitles, ',') else [] end as knownForTitles

    from source_data_name_basics
)

select * from corrected_for_emptiness_name_basics