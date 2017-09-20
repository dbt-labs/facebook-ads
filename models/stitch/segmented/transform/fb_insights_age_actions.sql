with age_gender as (

  select * from {{ref('fb_ads_insights_ag_actions')}}

)

select
  id,
  ad_id,
  date_day,
  action_destination,
  action_type,
  'age' as segment_type,
  age as segment,
  sum(num_actions) as num_actions
from
  age_gender
group by 1, 2, 3, 4, 5, 6, 7
