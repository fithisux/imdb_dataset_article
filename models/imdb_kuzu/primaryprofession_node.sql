{{ config(materialized='view') }}

with all_professions as (
    select 
    unnest(primaryProfession) as profession
    from {{ ref('name_basics_model_cleansed') }}
) 
select distinct profession from all_professions