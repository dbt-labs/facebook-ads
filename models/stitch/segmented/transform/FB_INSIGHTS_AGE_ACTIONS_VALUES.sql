with age_gender as (

  select * from {{ref('FB_ADS_INSIGHTS_AG_ACTIONS_VALUES')}}

)

select
  id,
  ad_id,
  date_day,
  action_destination,
  action_type,
  'age' as segment_type,
  age as segment,
  sum(action_value) as action_value
from
  age_gender
group by 1, 2, 3, 4, 5, 6, 7
