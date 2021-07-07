{% macro fivetran_fb_ads_campaigns() %}

    {{ adapter.dispatch('fivetran_fb_ads_campaigns', 'facebook_ads')() }}

{% endmacro %}


{% macro default__fivetran_fb_ads_campaigns() %}

select distinct

    id as campaign_id,
    nullif(name,'') as name

from
    {{ var('campaigns_table') }}

{% endmacro %}
