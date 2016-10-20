select
  id as campaign_id,
  name as campaign_name
from
  {{ var('campaigns_table') }}
