with platform_device as (

  select * from {{ref('fb_ads_insights_pd_actions_values')}}

)

select
  id,
  ad_id,
  date_day,
  action_destination,
  action_type,
  'platform' as segment_type,
  platform as segment,
  sum(action_value) as action_value
from
  platform_device
group by 1, 2, 3, 4, 5, 6, 7
