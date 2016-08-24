with ads as (

  select * from {{ref('facebook_ads')}}

), creatives as (

  select * from {{ref('facebook_ad_creatives')}}

), insights as (

  select * from {{ref('facebook_ad_insights')}}

), joined as (

  select
    *
  from insights
    inner join ads on insights.ad_id = ads.id
    inner join creatives on ads.creative_id = creatives.id

), aggregated as (

  select
    date_start::date as insight_date,
    utm_medium,
    utm_source,
    utm_campaign,
    utm_content,
    utm_term,
    sum(impressions) as impressions,
    sum(spend) as spend,
    sum(website_clicks) as clicks
  from joined
  group by 1, 2, 3, 4, 5, 6

)

select
  *,
  spend / nullif(clicks, 0) as cpc,
  spend / (nullif(impressions, 0) * .001::numeric(38,6)) as cpm
from aggregated
order by 1, 2, 3, 4, 5, 6
