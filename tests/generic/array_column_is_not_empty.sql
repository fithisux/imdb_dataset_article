{% test array_column_is_not_empty(model, array_column) %}

with validation as (

    select
        {{ array_column }} as array_field

    from {{ model }}

),

validation_errors as (

    select
        array_field

    from validation
    -- if this is true, then even_field is actually odd!
    where len(array_field) > 0

)

select *
from validation_errors

{% endtest %}