{{
    config(
        enabled = var('etl') == 'fivetran'
    )
}}

{{ fivetran_fb_url_tag() }}