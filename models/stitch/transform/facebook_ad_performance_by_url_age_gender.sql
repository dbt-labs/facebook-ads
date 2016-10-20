with insights as (

  select * from {{ref('facebook_ad_insights_age_gender_xf')}}

)

select
  date_start::date as insight_date,
  ad_id,
  campaign_id,
  age,
  gender,
  url,
  base_url,
  utm_medium,
  utm_source,
  utm_campaign,
  utm_content,
  utm_term,
  sum(coalesce(impressions__bigint, nullif(impressions__string, '')::int)) as impressions, --fix!
  sum(spend) as spend,
  sum(website_clicks) as clicks
from insights
group by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
