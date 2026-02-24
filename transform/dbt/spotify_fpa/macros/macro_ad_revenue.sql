{% macro calculate_ad_revenue(streams, impressions, cpm) %}
    ({{ streams }} * {{ impressions }} * {{ cpm }} / 1000)
{% endmacro %}
