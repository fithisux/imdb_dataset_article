{{ config(materialized='view') }}

with loaded_title_pricipals as (

    select

    cast(tconst as string) as tconst,
    cast(ordering as integer) as ordering,
    cast(nconst as string) as nconst,
    cast(category as string) as category,
    cast(job as string) as job,
    case 
        when characters is not null 
        then  list_transform(cast(characters as string[]), x -> replace(replace(x , '\"', chr(39)),'"', '')) 
        else [] 
    end as characters

    from {{ref('title_principals_model')}}

)

select * from loaded_title_pricipals