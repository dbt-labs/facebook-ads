with unioned as (

  select * from {{ref('fb_insights_age_actions')}}
  union all
  select * from {{ref('fb_insights_gender_actions')}}
  union all
  select * from {{ref('fb_insights_country_actions')}}
  union all
  select * from {{ref('fb_insights_placement_actions')}}
  union all
  select * from {{ref('fb_insights_device_actions')}}

)

select
  *,
  md5(date_day || '|' || ad_id || '|' || segment_type || '|' || segment) as segmented_insight_id
from unioned
