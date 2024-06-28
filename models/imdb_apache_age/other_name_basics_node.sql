{{ config(materialized='view') }}

select
nconst as id,
primaryName, 
birthYear, 
deathYear 
from {{ ref('name_basics_node') }}