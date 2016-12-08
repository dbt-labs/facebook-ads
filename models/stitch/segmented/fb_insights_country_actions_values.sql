with placement_device as (

  select * from {{ref('fb_ads_insights_c_actions_values')}}

)

select
  id,
  ad_id,
  date_day,
  action_destination,
  action_type,
  'country' as segment_type,
  null::varchar as segment,
  action_value
from
  placement_device
