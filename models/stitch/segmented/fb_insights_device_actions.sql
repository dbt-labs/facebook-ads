with placement_device as (

  select * from {{ref('fb_ads_insights_pd_actions')}}

)

select
  id,
  ad_id,
  date_day,
  action_destination,
  action_type,
  'device' as segment_type,
  device as segment,
  sum(num_actions) as num_actions
from
  placement_device
group by 1, 2, 3, 4, 5, 6, 7
