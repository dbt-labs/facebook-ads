with ads as (

  select * from dbt_jthandy.facebook_ads

), creatives as (

  select * from dbt_jthandy.facebook_ad_creatives

), insights as (

  select * from dbt_jthandy.facebook_ad_insights

), joined as (

  select *
  from insights
    inner join ads on insights.ad_id = ads.id
    inner join creatives on ads.creative_id = creatives.id

)

select
  ad_id, count(distinct campaign_id)
from joined
group by 1
having count(distinct campaign_id) > 1
