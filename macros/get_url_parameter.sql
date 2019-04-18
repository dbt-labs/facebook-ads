{% macro get_url_parameter() %}

        coalesce (
            {{ dbt_utils.get_url_parameter('url_tags', 'utm_source') }},
            {{ dbt_utils.get_url_parameter('url', 'utm_source') }} 
        ) as utm_source,
        coalesce (
            {{ dbt_utils.get_url_parameter('url_tags', 'utm_medium') }},
            {{ dbt_utils.get_url_parameter('url', 'utm_medium') }} 
        ) as utm_medium,
        coalesce (
            {{ dbt_utils.get_url_parameter('url_tags', 'utm_campaign') }},
            {{ dbt_utils.get_url_parameter('url', 'utm_campaign') }} 
        ) as utm_campaign,
        coalesce (
            {{ dbt_utils.get_url_parameter('url_tags', 'utm_content') }},
            {{ dbt_utils.get_url_parameter('url', 'utm_content') }} 
        ) as utm_content,
        coalesce (
            {{ dbt_utils.get_url_parameter('url_tags', 'utm_term') }},
            {{ dbt_utils.get_url_parameter('url', 'utm_term') }} 
        ) as utm_term

{% endmacro %}