{{ config(materialized='view') }}


select
tconst,
primaryTitle,
originalTitle,
isAdult,
startYear,
endYear,
runtimeMinutes,
from {{ ref('title_basics_model_cleansed') }}