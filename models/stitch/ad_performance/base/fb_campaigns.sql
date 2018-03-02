select
  nullif(id,'') as id,
  nullif(name,'') as name
from
  {{ var('CAMPAIGNS_TABLE') }}
