with fb_keyword_performance as (

    select * from {{ref('fb_ad_insights_xf')}}

),

fb_keyword_performance_agg as (

    select 
        date_day as campaign_date,
        url_host,
        url_path,
        utm_source,
        utm_medium,
        utm_campaign,
        utm_content,
        utm_term,
        'facebook ads' as platform,
        sum(clicks) as clicks,
        sum(impressions) as impressions,
        sum(spend) as spend
    from fb_keyword_performance
    group by 1, 2, 3, 4, 5, 6, 7, 8, 9

)

select * from fb_keyword_performance_agg