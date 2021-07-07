{% macro fivetran_fb_ad_insights() %}

    {{ adapter.dispatch('fivetran_fb_ad_insights', 'facebook_ads')() }}

{% endmacro %}


{% macro default__fivetran_fb_ad_insights() %}

with base as (

    select

        date::date as date_day,
        nullif(account_id,'') as account_id,
        nullif(account_name,'') as account_name,
        nullif(ad_id,'') as ad_id,
        nullif(adset_id,'') as adset_id,
        nullif(campaign_id,'') as campaign_id,
        impressions,
        clicks,
        unique_clicks,
        spend,
        frequency,
        reach,
        nullif(objective,'') as objective,
        canvas_avg_view_percent,
        canvas_avg_view_time,
        inline_link_clicks,
        inline_post_engagement,
        unique_inline_link_clicks,
        row_number() over (partition by date_day, ad_id order by _FIVETRAN_SYNCED desc) as row_num

    from
        {{ var('ads_insights_table') }}
),

final as (

    select
        *

    from base
    where row_num = 1

)

select * from final

{% endmacro %}
