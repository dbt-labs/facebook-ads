with actions as (

  select * from {{ref('fb_ads_insights_actions')}}

), insights as (

  select * from {{ref('fb_ad_insights_xf')}}

)

select
  md5(insights.id || '|' || actions.id) as id,
  insights.id as insights_id,
  actions.action_destination,
  actions.action_type,
  actions.num_actions
from actions
  inner join insights
    on actions.date_day = insights.date_day
    and actions.ad_id = insights.ad_id
