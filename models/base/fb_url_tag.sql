{% if var('etl') == 'stitch' %}
-- no url_tag table in stitch 
{% elif var('etl') == 'fivetran'%}
{{ fivetran_fb_url_tag() }}
{% endif %}