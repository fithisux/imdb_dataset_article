{{ config(materialized='view') }}

with all_attributes as (
    select 
    unnest(attributes) as attribute
    from {{ ref('title_akas_model_cleansed') }}
) 
select distinct attribute from all_attributes