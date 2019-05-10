{% macro nested_field(field, subfields) %}

    {{ adapter_macro('facebook_ads.nested_field', field, subfields) }}

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