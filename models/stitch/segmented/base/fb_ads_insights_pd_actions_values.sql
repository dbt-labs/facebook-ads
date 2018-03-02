with actions as (

  select * from {{ var('ADS_INSIGHTS_PD_ACTIONS_VALUES_TABLE') }}

)

select
  _sdc_level_0_id as id,
  nullif(_sdc_source_key_ad_id,'') as ad_id,
  _sdc_source_key_date_start::date as date_day,
  nullif(_sdc_source_key_impression_device,'') as device,
  nullif(_sdc_source_key_platform_position,'') as placement,
  nullif(_sdc_source_key_publisher_platform,'') as platform,
  nullif(action_destination,'') as action_destination,
  nullif(action_type,'') as action_type,
  value as action_value
from actions
