{% macro fivetran_fb_ad_creatives() %}

    {{ adapter.dispatch('fivetran_fb_ad_creatives', 'facebook_ads')() }}

{% endmacro %}

{% macro default__fivetran_fb_ad_creatives() %}

with base as (

    select

        id as creative_id,
        coalesce(page_link,template_page_link) as url,
        coalesce(page_link,template_page_link) as base_url,
        '/' || {{ dbt_utils.get_url_path('coalesce(page_link,template_page_link)') }} as url_path,
        row_number() over (partition by creative_id, page_link order by _FIVETRAN_SYNCED desc) as row_num

    from {{ var('ad_creatives_table') }}

),

final as (

    select
        *

    from base
    where row_num = 1

)

select * from final

{% endmacro %}
