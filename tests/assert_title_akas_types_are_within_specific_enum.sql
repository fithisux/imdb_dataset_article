-- Types in title aliases hould be in a specific list that can change without notice
--
with types_per_title as (
    select
    titleId,
    unnest(types) as some_type
    from {{ ref('title_akas_model' )}}
) 
select titleId, some_type 
from types_per_title
where some_type not in ('alternative', 'dvd', 'festival', 'tv', 'video', 'working', 'original', 'imdbDisplay')