{{ config(materialized='view') }}

select 
    titleId, 
    ordering, 
    title, 
    case when region in (select alpha2 from {{ref('countries_with_regional_codes')}}) then region else NULL end as region,
    case when language in (select alpha2 from {{ref('language_codes')}} ) then language else NULL end as language,
    types, 
    attributes, 
    isOriginalTitle
from {{ref('title_akas_model')}}