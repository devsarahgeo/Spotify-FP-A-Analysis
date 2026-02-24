{% test language_region(model, column_name) %}
SELECT *
FROM {{ model }}
WHERE LENGTH({{ column_name }}) < 2
{% endtest %}
