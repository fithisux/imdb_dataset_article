
-- Use the `ref` function to select from other models

select distinct(attributes)
from {{ ref('title_akas_model') }}
--where id = 1
