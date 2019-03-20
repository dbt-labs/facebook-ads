{% if var('etl') == 'stitch' %}
{{ stitch_fb_ad_creatives() }}
{% elif var('etl') == 'fivetran'%}

with creatives as (

{{ fivetran_fb_ad_creatives() }}

),

utms as (

{{fivetran_fb_url_tag()}}

)

select 
* 
from creatives
left join utms on utms.creative_id = creatives.id
{% endif %}