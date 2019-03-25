{% macro stitch_fb_ad_creatives() %}

    {{ adapter_macro('facebook_ads.stitch_fb_ad_creatives_child_links') }}

{% endmacro %}



{% macro snowflake__stitch_fb_ad_creatives() %}

{% set fields = [

    'object_story_spec',
    'child_link',
    '_sdc_batched_at',
    '_sdc_extracted_at',
    '_sdc_received_at',
    '_sdc_sequence',
    '_sdc_table_version'

]%}


with raw as (
    
    select * from {{ var('ad_creatives_table') }}
    
),

child_attachment_links as (
    
    select
        *,
        attachments.value:link::varchar as child_link
        
    from raw, 
    lateral flatten (input => object_story_spec:link_data:child_attachments) attachments
        where child_link ilike '%utm%'

),

aggregated as (
    
    select distinct
        id,
        
        {% for field in fields %}
        first_value({{ field }}) over (partition by id 
            order by _sdc_batched_at 
            rows between unbounded preceding and unbounded following) 
            as {{ field }}
        {% if not loop.last%} , {% endif %}
    {% endfor %}
        
    from child_attachment_links
    
)

select * from aggregated

{% endmacro %}