{{ config(materialized='view') }}

-- select * from {{ref('title_principals_model')}}
-- where nconst<>'nm2007716'
-- and tconst in (select tconst from {{ref('title_basics_model')}})

select * from {{ref('title_principals_model')}}
where tconst in (select tconst from {{ref('title_basics_model')}})
and nconst in (select nconst from {{ref('name_basics_model')}})