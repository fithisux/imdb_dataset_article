{{ config(materialized='view') }}

with loaded_title_basics as (

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

    from {{ref('title_basics_model')}}

)

select * from loaded_title_basics