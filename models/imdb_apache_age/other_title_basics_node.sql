{{ config(materialized='view') }}

select
tconst as id,
primaryTitle,
originalTitle,
isAdult,
startYear,
endYear,
runtimeMinutes
from {{ ref('title_basics_node') }}