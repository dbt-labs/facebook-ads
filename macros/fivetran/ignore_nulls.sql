{% macro ignore_nulls() %}

    {{ adapter.dispatch('ignore_nulls', 'facebook_ads')() }}

{% endmacro %}

{% macro default__ignore_nulls() %}

    ignore nulls )

{% endmacro %}

{% macro snowflake__ignore_nulls() %}

    ) ignore nulls

{% endmacro %}
