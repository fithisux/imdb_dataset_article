{{ config(materialized='view') }}

with source_data_title_basics as (

    select

    case when tconst='\N' then NULL else tconst end as tconst,
    case when titleType='\N' then NULL else titleType end as titleType,
    case when primaryTitle='\N' then NULL else primaryTitle end as primaryTitle,
    case when originalTitle='\N' then NULL else originalTitle end as originalTitle,
    case when isAdult='\N' then NULL else isAdult end as isAdult,
    case when startYear='\N' then NULL else startYear end as startYear,
    case when endYear='\N' then NULL else endYear end as endYear,
    case when runtimeMinutes='\N' then NULL else runtimeMinutes end as runtimeMinutes,
    case when genres='\N' then NULL else genres end as genres,
    
    FROM {{ source('external_source', 'title.basics') }}

), corrected_for_emptiness_title_basics as (

    select

    cast(tconst as string) as tconst,
    cast(titleType as string) as titleType,
    cast(primaryTitle as string) as primaryTitle,
    cast(originalTitle as string) as originalTitle,
    cast(isAdult as boolean) as isAdult,
    cast(startYear as integer) as startYear,
    cast(endYear as integer) as endYear,
    cast(runtimeMinutes as integer) as runtimeMinutes,
    case when genres is not null then regexp_split_to_array(genres, ',') else [] end as genres

    from source_data_title_basics
)

select * from corrected_for_emptiness_title_basics