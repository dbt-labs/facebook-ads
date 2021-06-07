{% macro fivetran_fb_ads_adsets() %}

    {{ adapter.dispatch('fivetran_fb_ads_adsets', 'facebook_ads')() }}

{% endmacro %}

{% macro default__fivetran_fb_ads_adsets() %}

with base as (

    select

        id as adset_id,
        nullif(name,'') as name,
        account_id,
        campaign_id,
        created_time,
        nullif(effective_status,'') as effective_status,
        row_number() over (partition by id, name, account_id, campaign_id, created_time order by _FIVETRAN_SYNCED desc) as row_num

    from
    {{ var('adsets_table') }}
),

final as (

    select
        *

    from base
    where row_num = 1

)

select * from final

{% endmacro %}
