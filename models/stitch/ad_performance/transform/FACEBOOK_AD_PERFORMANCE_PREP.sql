select

    md5(date_day::varchar || utm_medium::varchar || utm_source::varchar ||
        utm_campaign::varchar || utm_term::varchar || utm_content::varchar) as id,
    date_day,
    nullif(utm_medium,'') as utm_medium,
    nullif(utm_source,'') as utm_source,
    nullif(utm_campaign,'') as utm_campaign,
    nullif(utm_term, '') as utm_term,
    nullif(utm_content,'') as utm_content,
    null::bigint as criteria_id,
    null::bigint as ad_group_id,
    clicks,
    spend,
    impressions,
    'facebook ads'::varchar as ad_data_source

from {{ref('FB_AD_INSIGHTS_XF')}}
