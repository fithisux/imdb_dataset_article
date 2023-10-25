{{ config(materialized='view') }}

with source_data_title_akas as (

    select

    case when titleId='\N' then NULL else titleId end as titleId,
    case when ordering='\N' then NULL else ordering end as ordering,
    case when title='\N' then NULL else title end as title,
    case when region='\N' then NULL else region end as region,
    case when language='\N' then NULL else language end as language,
    case when types='\N' then NULL else types end as types,
    case when attributes='\N' then NULL else attributes end as attributes,
    case when isOriginalTitle='\N' then NULL else isOriginalTitle end as isOriginalTitle,

    FROM {{ source('external_source', 'title.akas') }}

), corrected_for_emptiness_title_akas as (

    select

    cast(titleId as string) as titleId,
    cast(ordering as integer) as ordering,
    cast(title as string) as title,
    cast(region as string) as region,
    cast(language as string) as language,
    regexp_split_to_array(coalesce(types, ''), '\x02') as types,
    regexp_split_to_array(coalesce(attributes, ''), '\x02') as attributes,
    cast(isOriginalTitle as boolean) as isOriginalTitle

    FROM source_data_title_akas

)

select * from corrected_for_emptiness_title_akas