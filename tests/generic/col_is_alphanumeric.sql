{% test col_is_alphanumeric (model, column_name) %}

SELECT
  {{column_name}}
FROM
  {{model}}
WHERE
  Not regexp_full_match({{column_name}}, '^[a-zA-Z0-9]+$')

{% endtest %}