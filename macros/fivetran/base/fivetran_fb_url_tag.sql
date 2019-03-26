{% macro fivetran_fb_url_tag() %}

    {{adapter_macro('facebook_ads.fivetran_fb_url_tag')}}

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
        type,
        key,
        creative_id,
        value

    from
        {{ var('url_tag_table') }}

),

pivot as (
    
    select 

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
            ) as {{value}}

            {% if not loop.last %}    
            ,
            {% endif %} 

        {% endfor %}

    from base

),

final as (

    select distinct
        creative_id,
        url_host,
        utm_source,
        utm_medium,
        utm_campaign,
        utm_content,
        utm_term

    from pivot

)

select * from final

{% endmacro %}