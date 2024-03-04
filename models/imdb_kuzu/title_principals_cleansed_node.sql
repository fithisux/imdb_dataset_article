{{ config(materialized='view') }}

select
tconst || '_' || cast(ordering as string) as id,
ordering,
job
 from {{ ref('title_principals_model_cleansed') }}