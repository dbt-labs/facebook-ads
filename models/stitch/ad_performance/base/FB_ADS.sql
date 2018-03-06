--there are multiple records for different statuses, but we don't need them for our purposes yet.
--if this table needs to be expended to include multiple rows per id, this will break downstream queries that depend
--on uniqueness on this id when joins are done.
select distinct
    nullif(id,'') as id,
    nullif(account_id,'') as account_id,
    nullif(adset_id,'') as adset_id,
    nullif(campaign_id,'') as campaign_id,
    nullif(name,'') as name,
    nullif(creative__id,'') as creative_id,
    created_time as created_at,
    updated_time as updated_at
from

{% if var('facebook:use_snowflake_adapter') %}

        {{ref('FB_ADS_SNOWFLAKE_ADAPTER')}}

{% else %}

        {{ var('ads_table') }}

{% endif %}
