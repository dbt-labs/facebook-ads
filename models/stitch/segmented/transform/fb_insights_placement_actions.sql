with platform_device as (

  select * from {{ref('FB_ADS_INSIGHTS_PD_ACTIONS')}}

)

select
  id,
  ad_id,
  date_day,
  action_destination,
  action_type,
  'placement' as segment_type,
  placement as segment,
  sum(num_actions) as num_actions
from
  platform_device
group by 1, 2, 3, 4, 5, 6, 7
