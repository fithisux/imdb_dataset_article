{% test array_column_has_specific_values(model, id_column, array_column, value_list) %}
-- thanks to https://stackoverflow.com/questions/29537684/add-quotes-to-elemens-of-the-list-in-jinja2-ansible
{%- set values_csv="'" + value_list|join("','") + "'" %}

with exploded_array_column as (
    select
    {{id_column}},
    unnest({{array_column}}) as element_array_column
    from {{model}}
) 
select {{id_column}}, element_array_column 
from exploded_array_column
where element_array_column not in ({{values_csv}})

{% endtest %}
