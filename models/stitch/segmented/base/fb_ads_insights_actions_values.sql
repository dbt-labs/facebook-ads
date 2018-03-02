with actions as (

  select * from {{ var('ADS_INSIGHTS_ACTIONS_VALUES_TABLE') }}

)

select
  _sdc_level_0_id as id,
  nullif(_sdc_source_key_ad_id,'') as ad_id,
  nullif(_sdc_source_key_adset_id,'') as adset_id,
  nullif(_sdc_source_key_campaign_id,'') as campaign_id,
  _sdc_source_key_date_start::date as date_day,
  nullif(action_destination,'') as action_destination,
  nullif(action_type,'') as action_type,
  value as action_value
from actions
