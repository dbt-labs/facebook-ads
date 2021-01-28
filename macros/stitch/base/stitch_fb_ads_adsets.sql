{% macro stitch_fb_ads_adsets() %}

    {{ adapter.dispatch('stitch_fb_ads_adsets',packages=facebook_ads._get_facebook_ads_namespaces())() }}

{% endmacro %}


{% macro default__stitch_fb_ads_adsets() %}

select

    id as adset_id,
    nullif(name,'') as name,
    nullif(account_id,'') as account_id,
    nullif(campaign_id,'') as campaign_id,
    created_time,
    nullif(effective_status,'') as effective_status
    
from {{ var('adsets_table') }}

{% endmacro %}