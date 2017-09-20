with country as (

  select * from {{ref('fb_ads_insights_country')}}

)

select
  date_day,
  account_id,
  account_name,
  ad_id,
  adset_id,
  campaign_id,
  objective,
  'country' as segment_type,
  country as segment,
  impressions,
  clicks,
  spend,
  app_store_clicks,
  call_to_action_clicks,
  deeplink_clicks,
  inline_link_clicks,
  social_clicks,
  social_impressions,
  total_action_value,
  total_actions,
  website_clicks
from
  country
