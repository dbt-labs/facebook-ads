with actions as (

  select * from {{ var('ads_insights_ag_actions_values_table') }}

)

select
  _sdc_level_0_id as id,
  _sdc_source_key_ad_id as ad_id,
  _sdc_source_key_date_start::date as date_day,
  _sdc_source_key_age as age,
  _sdc_source_key_gender as gender,
  action_destination,
  action_type,
  value as action_value
from actions
