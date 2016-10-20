with ads as (

  select * from {{ref('fb_ads')}}

), creatives as (

  select * from {{ref('fb_ad_creatives')}}

), insights as (

  select * from {{ref('fb_insights_segmented')}}

)
select
  insights.*,
  creatives.base_url,
  creatives.url,
  creatives.utm_medium,
  creatives.utm_source,
  creatives.utm_campaign,
  creatives.utm_content,
  creatives.utm_term
from insights
  inner join ads on insights.ad_id = ads.id
  inner join creatives on ads.creative_id = creatives.id
