{{ config(materialized='view') }}

with loaded_name_basics as (

    select

    cast(nconst as string) as nconst,
    cast(primaryName as string) as primaryName,
    TRY_CAST(birthYear as integer) as birthYear,
    TRY_CAST(deathYear as integer) as deathYear,
    case when primaryProfession is not null then regexp_split_to_array(primaryProfession, ',') else [] end as primaryProfession,
    case when knownForTitles is not null then regexp_split_to_array(knownForTitles, ',') else [] end as knownForTitles
    
    from {{ref('name_basics_model')}}

)

select * from loaded_name_basics