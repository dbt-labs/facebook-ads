{% macro stitch_fb_ads_campaigns() %}

    {{ adapter.dispatch('stitch_fb_ads_campaigns', packages=facebook_ads._get_facebook_ads_namespaces())() }}

{% endmacro %}


{% macro default__stitch_fb_ads_campaigns() %}

select

    nullif(id,'') as campaign_id,
    nullif(name,'') as name

from {{ var('campaigns_table') }}

{% endmacro %}
