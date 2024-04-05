{% test strictly_left_smaller_than_right(model, id, left_column_name, right_column_name) %}

with something as (
    select {{id}}, {{left_column_name}}, {{right_column_name}}
    from {{model}}
    where {{left_column_name}} is not null and {{right_column_name}} is not null
)
select {{id}}
from something
where {{left_column_name}} > {{right_column_name}}
{% endtest %}