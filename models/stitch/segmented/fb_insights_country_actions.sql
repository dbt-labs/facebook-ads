with countries as (

  select * from {{ref('fb_ads_insights_c_actions')}}

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
