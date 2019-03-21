{% macro fivetran_fb_url_tag() %}

    {{adapter_macro('facebook_ads.fivetran_fb_url_tag')}}

{% endmacro %}

{% macro default__fivetran_fb_url_tag() %}

with base as (
    
select distinct
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
    
        {% for key, value in {
        "affcode": "url_host",
        "utm_source": "utm_source",
        "utm_medium": "utm_medium",
        "utm_campaign": "utm_campaign",
        "utm_content": "utm_content",
        "utm_term": "utm_term"
        }.items()%}

            first_value(
                case 
                    when key = '{{key}}' then value
                    else null  
                end

                {% if target.type == 'snowflake' %}
                ) ignore nulls 
                {% else %}
                ignore nulls )
                {% endif %}

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

    select 
        creative_id,
        url_host,
        utm_source,
        utm_medium,
        utm_campaign,
        utm_content,
        utm_term

    from pivot
    {{dbt_utils.group_by(7)}}
)

select * from final

{% endmacro %}