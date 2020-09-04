{% macro ignore_nulls() %}

    {{ adapter.dispatch('ignore_nulls', packages=facebook_ads._get_facebook_ads_namespaces())() }}

{% endmacro %}

{% macro default__ignore_nulls() %}

    ignore nulls )

{% endmacro %}

{% macro snowflake__ignore_nulls() %}

    ) ignore nulls

{% endmacro %}
