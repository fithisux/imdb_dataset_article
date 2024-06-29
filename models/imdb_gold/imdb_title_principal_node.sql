{{ config(materialized='view') }}

select
tconst || '_' || cast(ordering as string) as principal_id,
tconst,
cast(ordering as int), 
job
 from {{ ref('title_principals_model_cleansed') }}