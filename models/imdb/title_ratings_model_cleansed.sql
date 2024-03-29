{{ config(materialized='table') }}

select * from {{ref('title_ratings_model_casted')}}