{% macro fivetran_fb_ads_adsets() %}

    {{ adapter_macro('facebook_ads.fivetran_fb_ads_adsets') }}

{% endmacro %}


{% macro default__fivetran_fb_ads_adsets() %}
with final as (
    select
    
        id as adset_id,
        nullif(name,'') as name,
        nullif(account_id,'') as account_id,
        nullif(campaign_id,'') as campaign_id,
        created_time,
        nullif(effective_status,'') as effective_status
        
    from
  {{ var('adsets_table') }}

{% endmacro %}

{% macro snowflake__fivetran_fb_ads_adsets() %}

select

    id as adset_id,
    nullif(name,'') as name,
    account_id as account_id,
    campaign_id as campaign_id,
    created_time,
    nullif(effective_status,'') as effective_status

from
  {{ var('adsets_table') }}

{% endmacro %}