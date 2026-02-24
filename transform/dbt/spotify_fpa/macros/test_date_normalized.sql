{% test date_normalized(model, column_name) %}
SELECT *
FROM {{ model }}
WHERE EXTRACT(YEAR FROM {{ column_name }}) NOT BETWEEN 1900 AND 2100
{% endtest %}
