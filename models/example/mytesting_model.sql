
-- Use the `ref` function to select from other models
{{ config(materialized='view') }}
select distinct("alpha-2")
from {{ ref('countries_with_regional_codes') }}
--where id = 1
