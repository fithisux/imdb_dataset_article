{{ config(materialized='view') }}

with loaded_title_akas as (

    select

    cast(titleId as string) as titleId,
    cast(ordering as integer) as ordering,
    cast(title as string) as title,
    cast(region as string) as region,
    cast(language as string) as language,
    case when types is not null then regexp_split_to_array(types, '\x02') else [] end as types,
    case when attributes is not null then regexp_split_to_array(attributes, '\x02') else [] end as attributes,
    cast(isOriginalTitle as boolean) as isOriginalTitle

    from {{ref('title_akas_model')}}

)

select * from loaded_title_akas