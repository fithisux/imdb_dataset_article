{{ config(materialized='view') }}

with all_characterss as (
    select 
    unnest(characters) as somecharacter
    from {{ ref('title_principals_model_cleansed') }}
) 
select distinct somecharacter from all_characterss