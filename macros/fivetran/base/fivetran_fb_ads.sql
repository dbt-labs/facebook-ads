{% macro fivetran_fb_ads() %}

    {{ adapter_macro('facebook_ads.fivetran_fb_ads') }}

{% endmacro %}

--there are multiple records for different statuses, but we don't need them for our purposes yet.
--if this table needs to be expended to include multiple rows per id, this will break downstream queries that depend
--on uniqueness on this id when joins are done.

{% macro default__fivetran_fb_ads() %}

select distinct

    nullif(id,'') as id,
    nullif(account_id,'') as account_id,
    nullif(ad_set_id,'') as adset_id,
    nullif(campaign_id,'') as campaign_id,
    nullif(name,'') as name,
    nullif(creative_id,'') as creative_id,
    created_time as created_at,
    updated_time as updated_at

from
  {{ var('ads_table') }}

{% endmacro %}


{% macro snowflake__fivetran_fb_ads() %}

select distinct

    id as id,
    account_id as account_id,
    ad_set_id as adset_id,
    campaign_id as campaign_id,
    nullif(name,'') as name,
    creative_id::bigint as creative_id,
    created_time as created_at,
    updated_time as updated_at

from
    {{ var('ads_table') }}

{% endmacro %}