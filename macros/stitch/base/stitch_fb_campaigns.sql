{% macro stitch_fb_ads_campaigns() %}

    {{ adapter_macro('facebook_ads.stitch_fb_ads_campaigns') }}

{% endmacro %}


{% macro default__stitch_fb_ads_campaigns() %}

select

    nullif(id,'') as id,
    nullif(name,'') as name
    
from {{ var('campaigns_table') }}

{% endmacro %}