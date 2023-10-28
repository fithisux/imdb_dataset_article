{{ config(materialized='view') }}

select * from {{ref('title_principals_model')}}
where nconst<>'nm2007716'
and tconst in (select tconst from {{ref('title_basics_model')}})