{% if var('etl') == 'stitch' %}
{{ stitch_fb_ad_creatives() }}
{% elif var('etl') == 'fivetran'%}

with creatives as (

    {{ fivetran_fb_ad_creatives() }}

),

utms as (

    {{fivetran_fb_url_tag()}}

),

final as (

    select 
        * 

    from creatives
    left join utms using (creative_id)

)

select * from final

{% endif %}