{{ config(materialized='table') }}

select 
    titleId, 
    ordering, 
    title, 
    region, 
    language, 
    types, 
    attributes, 
    isOriginalTitle
from {{ref('title_akas_model')}}
where region in (select alpha2 from {{ref('countries_with_regional_codes')}} )
and language in (select alpha2 from {{ref('language_codes')}} )
UNION
select 
    titleId, 
    ordering, 
    title, 
    region, 
    NULL, 
    types, 
    attributes, 
    isOriginalTitle
from {{ref('title_akas_model')}}
where region in (select alpha2 from {{ref('countries_with_regional_codes')}} )
and language not in (select alpha2 from {{ref('language_codes')}} )
UNION
select 
    titleId, 
    ordering, 
    title, 
    NULL, 
    language, 
    types, 
    attributes, 
    isOriginalTitle
from {{ref('title_akas_model')}}
where region not in (select alpha2 from {{ref('countries_with_regional_codes')}} )
and language in (select alpha2 from {{ref('language_codes')}} )
UNION
select 
    titleId, 
    ordering, 
    title, 
    NULL, 
    NULL, 
    types, 
    attributes, 
    isOriginalTitle
from {{ref('title_akas_model')}}
where region not in (select alpha2 from {{ref('countries_with_regional_codes')}} )
and language not in (select alpha2 from {{ref('language_codes')}} )