{{ config(materialized='view') }}

select * from {{ source('external_source', 'title.ratings') }}