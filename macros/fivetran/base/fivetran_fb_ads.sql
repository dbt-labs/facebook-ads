{% macro fivetran_fb_ads() %}

    {{ adapter.dispatch('fivetran_fb_ads', 'facebook_ads')() }}

{% endmacro %}

--there are multiple records for different statuses, but we don't need them for our purposes yet.
--if this table needs to be expended to include multiple rows per id, this will break downstream queries that depend
--on uniqueness on this id when joins are done.

{% macro default__fivetran_fb_ads() %}

with base as (

    select

        id as ad_id,
        account_id,
        ad_set_id as adset_id,
        campaign_id,
        nullif(name,'') as name,
        creative_id::bigint as creative_id,
        created_time as created_at,
        updated_time as updated_at,
        row_number() over (partition by ad_id, updated_at order by _FIVETRAN_SYNCED desc) as row_num

    from
        {{ var('ads_table') }}
),

final as (

    select
        *

    from base
    where row_num = 1

)

select * from final

{% endmacro %}
