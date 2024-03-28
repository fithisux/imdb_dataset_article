{{ config(materialized='table') }}

select * from {{ref('title_episode_model_casted')}}