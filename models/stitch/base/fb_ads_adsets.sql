select
  id,
  name,
  account_id,
  campaign_id,
  created_time,
  effective_status
from
  {{ var('adsets_table') }}
