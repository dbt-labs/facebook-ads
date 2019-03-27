{% macro stitch_fb_ad_insights() %}

    {{ adapter_macro('facebook_ads.stitch_fb_ad_insights') }}

{% endmacro %}


{% macro default__stitch_fb_ad_insights() %}

select
    date_start::date as date_day,
    account_id,
    account_name,
    ad_id,
    adset_id,
    campaign_id,
    impressions,
    clicks,
    unique_clicks,
    spend,
    frequency,
    reach,
    objective,
    canvas_avg_view_percent,
    canvas_avg_view_time,
    inline_link_clicks,
    inline_post_engagement,
    unique_inline_link_clicks

from {{ var('ads_insights_table') }}


{% endmacro %}