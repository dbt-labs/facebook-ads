{% macro fivetran_fb_ads_campaigns() %}

    {{ adapter_macro('facebook_ads.fivetran_fb_ads_campaigns') }}

{% endmacro %}


{% macro default__fivetran_fb_ads_campaigns() %}

select

    nullif(id,'') as id,
    nullif(name,'') as name

from
    {{ var('campaigns_table') }}

{% endmacro %}

{% macro snowflake__fivetran_fb_ads_campaigns() %}

select

    id as id,
    nullif(name,'') as name

from
    {{ var('campaigns_table') }}

{% endmacro %}