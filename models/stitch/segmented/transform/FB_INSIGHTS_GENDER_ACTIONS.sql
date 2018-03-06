with age_gender as (

  select * from {{ref('FB_ADS_INSIGHTS_AG_ACTIONS')}}

)

select
  id,
  ad_id,
  date_day,
  action_destination,
  action_type,
  'gender' as segment_type,
  gender as segment,
  sum(num_actions) as num_actions
from
  age_gender
group by 1, 2, 3, 4, 5, 6, 7
