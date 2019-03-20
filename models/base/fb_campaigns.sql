{% if var('etl') == 'stitch' %}
{{ stitch_fb_campaigns() }}
{% elif var('etl') == 'fivetran'%}
{{ fivetran_fb_ads_campaigns() }}
{% endif %}