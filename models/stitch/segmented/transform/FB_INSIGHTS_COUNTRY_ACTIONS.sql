with countries as (

  select * from {{ref('FB_ADS_INSIGHTS_C_ACTIONS')}}

)

select
  id,
  ad_id,
  date_day,
  action_destination,
  action_type,
  'country' as segment_type,
  null::varchar as segment,
  num_actions
from
  countries
