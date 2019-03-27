{% macro ignore_nulls() %}

    {{ adapter_macro('facebook_ads.ignore_nulls') }}

{% endmacro %}

{% macro default__ignore_nulls() %}

    ignore nulls )

{% endmacro %}

{% macro snowflake__ignore_nulls() %}

    ) ignore nulls

{% endmacro %}