{{
    config(
        enabled = var('etl') == 'stitch'
    )
}}

{{ stitch_fb_ads_adsets() }}