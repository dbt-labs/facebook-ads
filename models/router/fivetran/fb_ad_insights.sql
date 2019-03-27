{{
    config(
        enabled = var('etl') == 'fivetran'
    )
}}

{{ fivetran_fb_ad_insights() }}