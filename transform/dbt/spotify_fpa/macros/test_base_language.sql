{% test base_language(model, column_name) %}
SELECT *
FROM {{ model }}
WHERE {{ column_name }} IS NULL OR LENGTH({{ column_name }}) < 2
{% endtest %}
