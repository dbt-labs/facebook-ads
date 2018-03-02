with actions as (

  select * from {{ref('FB_ADS_INSIGHTS_ACTIONS_VALUES')}}

), insights as (

  select * from {{ref('FB_AD_INSIGHTS_XF')}}

)

select
  md5(insights.id || '|' || actions.id) as id,
  insights.id as insights_id,
  actions.action_destination,
  actions.action_type,
  actions.action_value
from actions
  inner join insights
    on actions.date_day = insights.date_day
    and actions.ad_id = insights.ad_id
