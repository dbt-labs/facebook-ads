with placement_device as (

  select * from {{ref('FB_ADS_INSIGHTS_C_ACTIONS_VALUES')}}

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
