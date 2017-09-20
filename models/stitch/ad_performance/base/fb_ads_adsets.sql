select
  id,
  nullif(name,'') as name,
  nullif(account_id,'') as account_id,
  nullif(campaign_id,'') as campaign_id,
  created_time,
  nullif(effective_status,'') as effective_status
from
  {{ var('adsets_table') }}
