{% macro fivetran_fb_ad_creatives() %}

    {{ adapter_macro('facebook_ads.fivetran_fb_ad_creatives') }}

{% endmacro %}


{% macro default__fivetran_fb_ad_creatives() %}

with base as (

    select

        id as creative_id,
        coalesce(page_link,template_page_link) as url,
        coalesce(page_link,template_page_link) as base_url,
        '/' || split_part(split_part(split_part(coalesce(page_link,template_page_link), '//', 2), '/', 2), '?', 1) as url_path,

    from {{ var('ad_creatives_table') }}

)

    select * from base

{% endmacro %}


{% macro snowflake__fivetran_fb_ad_creatives() %}

with base as (

    select

        id as creative_id,
        coalesce(page_link,template_page_link) as url,
        coalesce(page_link,template_page_link) as base_url,
        '/' || parse_url(coalesce(page_link,template_page_link))['path']::varchar as url_path

    from {{ var('ad_creatives_table') }}
    group by 1,2,3,4

)

select * from base

{% endmacro %}