select distinct
  id,
  name,
  creative__id as creative_id,
  created_time as created_at
from
  {{ var('ads_table') }}
