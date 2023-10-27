{{ config(materialized='view') }}

select 
tconst,
list_filter(writers, x -> x <> 'nm2007716') as writers,
list_filter(directors, x -> x <> 'nm12428300') as directors,
from {{ref('title_crew_model')}}
