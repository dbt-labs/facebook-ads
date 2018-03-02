with platform_device as (

  select * from {{ref('FB_ADS_INSIGHTS_PLATFORM_DEVICE')}}

)

select
  date_day,
  account_id,
  account_name,
  ad_id,
  adset_id,
  campaign_id,
  objective,
  'placement' as segment_type,
  placement as segment,
  sum(impressions) as impressions,
  sum(clicks) as clicks,
  sum(spend) as spend,
  sum(app_store_clicks) as app_store_clicks,
  sum(call_to_action_clicks) as call_to_action_clicks,
  sum(deeplink_clicks) as deeplink_clicks,
  sum(inline_link_clicks) as inline_link_clicks,
  sum(social_clicks) as social_clicks,
  sum(social_impressions) as social_impressions,
  sum(total_action_value) as total_action_value,
  sum(total_actions) as total_actions,
  sum(website_clicks) as website_clicks
from
  platform_device
group by
  1, 2, 3, 4, 5, 6, 7, 8, 9
