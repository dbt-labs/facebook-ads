{% if var('etl') == 'stitch' %}
{{ stitch_fb_ads() }}
{% elif var('etl') == 'fivetran'%}
{{ fivetran_fb_ads() }}
{% endif %}