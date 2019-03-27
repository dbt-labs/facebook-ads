{{
    config(
        enabled = var('etl') == 'fivetran'
    )
}}

{{ fivetran_fb_ads_campaigns() }}