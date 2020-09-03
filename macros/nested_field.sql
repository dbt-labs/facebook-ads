{% macro nested_field(field, subfields) %}

    {{ adapter.dispatch('nested_field', packages=facebook_ads._get_facebook_ads_namespaces())(field, subfields) }}

{% endmacro %}


{% macro default__nested_field(field, subfields) %}

    {{field}}__{{ subfields|join('__') }}

{% endmacro %}


{% macro bigquery__nested_field(field, subfields) %}

    {{field}}.{{ subfields|join('.') }}

{% endmacro %}


{% macro snowflake__nested_field(field, subfields) %}

    {{field ~ "['" ~ subfields|join("']['") ~ "']" }}

{% endmacro %}
