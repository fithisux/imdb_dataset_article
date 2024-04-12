{{ config(materialized='table') }}

SELECT * from {{ref('title_basics_model_casted')}}