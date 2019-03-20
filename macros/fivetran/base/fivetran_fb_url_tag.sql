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

        creative_id as creative_id,
    
        {% for key_value in [
        ['affcode','url_host'],
        ['utm_source','utm_source'],
        ['utm_medium','utm_medium'],
        ['utm_campaign','utm_campaign'],
        ['utm_content','utm_content'],
        ['utm_term','utm_term']
        ]%}

        first_value(
            case 
                when key = '{{key_value[0]}}' then value
                else null  
            end
            ignore nulls
        ) over (
            partition by creative_id
            order by key
        ) as {{key_value[1]}}

        {% if not loop.last %}    
        ,
        {% endif %} 

        {% endfor %}

    from base

)

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


{% endmacro %}


{% macro snowflake__fivetran_fb_url_tag() %}

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

        creative_id as creative_id,
    
        {% for key_value in [
        ['affcode','url_host'],
        ['utm_source','utm_source'],
        ['utm_medium','utm_medium'],
        ['utm_campaign','utm_campaign'],
        ['utm_content','utm_content'],
        ['utm_term','utm_term']
        ]%}

        first_value(
            case 
                when key = '{{key_value[0]}}' then value
                else null  
            end
        ) ignore nulls over (
            partition by creative_id
            order by key
        ) as {{key_value[1]}}

        {% if not loop.last %}    
        ,
        {% endif %} 

        {% endfor %}

    from base

)

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


{% endmacro %}