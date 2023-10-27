{% test array_column_exists_in_table(model, column_name, model2, array_column2) %}

with exploded as (
    select unnest({{column_name}}) as left_id
    from {{model}}
), relational as (
    select {{array_column2}} as right_id
    from {{model2}}
)
select left_id
from exploded
left join relational
on left_id=right_id
where left_id is not null and right_id is null
{% endtest %}