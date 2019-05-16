{{
    config(
        enabled = var('etl') == 'stitch'
    )
}}

{{ stitch_fb_ad_creatives__child_links() }}