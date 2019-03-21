{% if var('etl') == 'stitch' %}

{{ stitch_fb_ads_adsets() }}

{% elif var('etl') == 'fivetran'%}

{{ fivetran_fb_ads_adsets() }}

{% endif %}