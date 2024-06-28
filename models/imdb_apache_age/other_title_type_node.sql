{{ config(materialized='view') }}

select
title_type as id,
from {{ ref('title_type_node') }}