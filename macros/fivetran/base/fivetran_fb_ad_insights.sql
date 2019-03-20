{% macro fivetran_fb_ad_insights() %}

    {{ adapter_macro('facebook_ads.fivetran_fb_ad_insights') }}

{% endmacro %}


{% macro default__fivetran_fb_ad_insights() %}

select

    date::date as date_day,
    nullif(account_id,'') as account_id,
    nullif(account_name,'') as account_name,
    nullif(ad_id,'') as ad_id,
    nullif(adset_id,'') as adset_id,
    nullif(campaign_id,'') as campaign_id,
    impressions,
    clicks,
    unique_clicks,
    spend,
    frequency,
    reach,
    nullif(objective,'') as objective,
    canvas_avg_view_percent,
    canvas_avg_view_time,
    inline_link_clicks,
    inline_post_engagement,
    unique_inline_link_clicks
  
from
  {{ var('ads_insights_table') }}


{% endmacro %}


{% macro snowflake__fivetran_fb_ad_insights() %}

select

    date::date as date_day,
    nullif(account_id,'') as account_id,
    nullif(account_name,'') as account_name,
    nullif(ad_id,'') as ad_id,
    nullif(adset_id,'') as adset_id,
    nullif(campaign_id,'') as campaign_id,
    impressions,
    clicks,
    unique_clicks,
    spend,
    frequency,
    reach,
    nullif(objective,'') as objective,
    canvas_avg_view_percent,
    canvas_avg_view_time,
    inline_link_clicks,
    inline_post_engagement,
    unique_inline_link_clicks
 
from
  {{ var('ads_insights_table') }}

{% endmacro %}