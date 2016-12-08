with actions as (

  select * from {{ var('ads_insights_pd_actions_table') }}

)

select
  _sdc_level_0_id as id,
  _sdc_source_key_ad_id as ad_id,
  _sdc_source_key_date_start::date as date_day,
  _sdc_source_key_impression_device as device,
  _sdc_source_key_placement as placement,
  action_destination,
  action_type,
  value as num_actions
from actions
