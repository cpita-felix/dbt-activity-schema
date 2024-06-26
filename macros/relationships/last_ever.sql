{% macro last_ever_join_clause(alias=dbt_activity_schema.appended()) %}
(
    {{ alias }}.{{ dbt_activity_schema.columns().activity_repeated_at }} is null
)
{% endmacro %}

{% macro last_ever() %}

{% do return(namespace(
    name="last_ever",
    aggregation_func=dbt_activity_schema.min,
    join_clause=dbt_activity_schema.last_ever_join_clause,
    where_clause=dbt_activity_schema.last_ever_join_clause(dbt_activity_schema.primary())
)) %}

{% endmacro %}
