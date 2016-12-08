with placement_device as (

  select * from {{ref('fb_ads_insights_pd_actions_values')}}

)

select
  id,
  ad_id,
  date_day,
  action_destination,
  action_type,
  'device' as segment_type,
  device as segment,
  sum(action_value) as action_value
from
  placement_device
group by 1, 2, 3, 4, 5, 6, 7
