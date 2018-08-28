with bing_keyword_performance as (

    select * from {{ref('fb_ad_insights_xf')}}

),

bing_keyword_performance_agg as (

    select 
        date_day as campaign_date,
        parse_url(url)['host']::varchar as url_host,
        '/' || parse_url(url)['path']::varchar as url_path,
        utm_source,
        utm_medium,
        utm_campaign,
        utm_content,
        utm_term,
        sum(clicks) as clicks,
        sum(impressions) as impressions,
        sum(spend) as spend
    from bing_keyword_performance
    group by 1, 2, 3, 4, 5, 6, 7, 8

)

select * from bing_keyword_performance_agg