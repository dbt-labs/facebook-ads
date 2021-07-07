{% macro fivetran_fb_url_tag() %}

    {{adapter.dispatch('fivetran_fb_url_tag', 'facebook_ads')() }}

{% endmacro %}

{% macro default__fivetran_fb_url_tag() %}

{% set utm_key_value_pairs={
"affcode": "url_host",
"utm_source": "utm_source",
"utm_medium": "utm_medium",
"utm_campaign": "utm_campaign",
"utm_content": "utm_content",
"utm_term": "utm_term"
} %}

with base as (

    select
        nullif(type,'') as type,
        nullif(key,'') as key,
        creative_id,
        nullif(value,'') as value

    from
        {{ var('url_tag_table') }}

),

final as (

    select distinct

        creative_id,

        {% for key, value in utm_key_value_pairs.items()%}

            first_value(
                case
                    when key = '{{key}}' then value
                    else null
                end

                {{facebook_ads.ignore_nulls()}}

            over (
                partition by creative_id
                order by key
                rows between unbounded preceding and unbounded following
            ) as {{value}}

            {% if not loop.last %}
            ,
            {% endif %}

        {% endfor %}

    from base

)

select * from final

{% endmacro %}
