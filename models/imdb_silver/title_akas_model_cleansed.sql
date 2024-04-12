{{ config(materialized='table') }}

select 
    titleId, 
    ordering, 
    title, 
    case when region in (select alpha2 from {{ref('region_codes')}}) then region else NULL end as region,
    case when language in (select alpha2 from {{ref('language_codes')}} ) then language else NULL end as language,
    types, 
    attributes, 
    isOriginalTitle
from {{ref('title_akas_model_casted')}}
where titleId in (select tconst from {{ref('title_basics_model_cleansed')}})