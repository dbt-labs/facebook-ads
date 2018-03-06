with platform_device as (

  select * from {{ref('FB_ADS_INSIGHTS_PD_ACTIONS_VALUES')}}

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
  platform_device
group by 1, 2, 3, 4, 5, 6, 7
