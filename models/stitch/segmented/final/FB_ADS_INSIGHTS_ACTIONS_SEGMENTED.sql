with unioned as (

  select * from {{ref('FB_INSIGHTS_AGE_ACTIONS')}}
  union all
  select * from {{ref('FB_INSIGHTS_GENDER_ACTIONS')}}
  union all
  select * from {{ref('FB_INSIGHTS_COUNTRY_ACTIONS')}}
  union all
  select * from {{ref('FB_INSIGHTS_PLACEMENT_ACTIONS')}}
  union all
  select * from {{ref('FB_INSIGHTS_DEVICE_ACTIONS')}}

), insights as (

  select * from {{ref('FB_INSIGHTS_SEGMENTED_XF')}}

)

select
  md5(insights.id || '|' || unioned.id) as id,
  insights.id as segmented_insight_id,
  unioned.ad_id,
  unioned.date_day,
  unioned.action_destination,
  unioned.action_type,
  unioned.segment_type,
  unioned.segment,
  unioned.num_actions
from unioned
  inner join insights
    on unioned.date_day = insights.date_day
    and unioned.ad_id = insights.ad_id
    and unioned.segment_type = insights.segment_type
    and unioned.segment = insights.segment
