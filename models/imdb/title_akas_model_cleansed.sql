select * from {{ref('title_akas_model')}}
where region in (select alpha2 from {{ref('countries_with_regional_codes')}} )
and language in (select alpha2 from {{ref('language_codes')}} )