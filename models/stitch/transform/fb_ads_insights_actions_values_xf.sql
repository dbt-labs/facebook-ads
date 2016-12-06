with actions as (

  select * from {{ref('fb_ads_insights_actions_values')}}

)

select
  md5(ad_id || '|' || date_day || '|' || id) as id,
  md5(date_day || '|' || ad_id) as insights_id,
  action_destination,
  action_type,
  value as action_value
from actions
