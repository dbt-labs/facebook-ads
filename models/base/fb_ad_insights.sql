{% if var('etl') == 'stitch' %}

{{ stitch_fb_ad_insights() }}

{% elif var('etl') == 'fivetran'%}

{{ fivetran_fb_ad_insights() }}

{% endif %}