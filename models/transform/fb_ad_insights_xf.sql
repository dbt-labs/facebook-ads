with ads as (

  select * from {{ref('fb_ads_xf')}}

), creatives as (

  select * from {{ref('fb_ad_creatives')}}

), insights as (

  select * from {{ref('fb_ad_insights')}}

), campaigns as (

  select * from {{ref('fb_campaigns')}}

), adsets as (

  select * from {{ref('fb_adsets_xf')}}

), final as (

    select

        {{ dbt_utils.generate_surrogate_key(['insights.date_day', 'insights.ad_id']) }} as id,
        insights.*,
        creatives.base_url,
        creatives.url,
        creatives.url_host,
        creatives.url_path,
        creatives.utm_medium,
        creatives.utm_source,
        creatives.utm_campaign,
        creatives.utm_content,
        creatives.utm_term,
        ads.unique_id as ad_unique_id,
        ads.name as ad_name,
        campaigns.name as campaign_name,
        adsets.name as adset_name

    from insights
    left outer join ads
        on insights.ad_id = ads.ad_id
        and insights.date_day >= date_trunc('day', ads.effective_from)::date
        and (insights.date_day < date_trunc('day', ads.effective_to)::date or ads.effective_to is null)
    left outer join creatives on ads.creative_id = creatives.creative_id
    left outer join campaigns on campaigns.campaign_id = insights.campaign_id
    left outer join adsets on adsets.adset_id = insights.adset_id
--these have to be an outer join because while the stitch integration goes
--back in time for the core reporting tables (insights, etc), it doesn't go back
--in time for the lookup tables. so there are actually lots of ad_ids that don't
--exist when you try to do the join, but they're always prior to the date you
--initially made the connection.

)

select * from final
