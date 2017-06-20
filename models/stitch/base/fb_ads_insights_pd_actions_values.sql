with actions as (

  select * from {{ var('ads_insights_pd_actions_values_table') }}

)

select
  _sdc_level_0_id as id,
  nullif(_sdc_source_key_ad_id,'') as ad_id,
  _sdc_source_key_date_start::date as date_day,
  nullif(_sdc_source_key_impression_device,'') as device,
  nullif(_sdc_source_key_placement,'') as placement,
  nullif(action_destination,'') as action_destination,
  nullif(action_type,'') as action_type,
  value as action_value
from actions
