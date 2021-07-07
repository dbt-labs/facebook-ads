-- There are cases where ads can have multiple links attached to them.
-- This model was created to extract all the child links and return the first
-- instance where a URL contains utm parameters.


{% macro stitch_fb_ad_creatives__child_links() %}

    {{ adapter.dispatch('stitch_fb_ad_creatives__child_links', 'facebook_ads')() }}

{% endmacro %}

{% macro default__stitch_fb_ad_creatives__child_links() %}


with base as (

    select * from {{ var('ad_creatives__child_links_table') }}

),

child_attachment_links as (

    select

        _sdc_source_key_id as creative_id,
        _sdc_batched_at,
        link as child_link

    from base
    where child_link ilike '%utm%'

),

aggregated as (

    select distinct

        creative_id,
        first_value(child_link) over (
            partition by creative_id
            order by _sdc_batched_at
            rows between unbounded preceding and unbounded following
        ) as child_link

    from child_attachment_links

)

select * from aggregated

{% endmacro %}


{% macro snowflake__stitch_fb_ad_creatives__child_links() %}


{% set fields = [

    'object_story_spec',
    'child_link',

]%}

with base as (

    select * from {{ var('ad_creatives_table') }}

),

child_attachment_links as (

    select
        *,
        attachments.value:link::varchar as child_link

    from base,
        lateral flatten (input => object_story_spec:link_data:child_attachments) attachments
    where child_link ilike '%utm%'

),

aggregated as (

    select distinct
        id as creative_id,

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
