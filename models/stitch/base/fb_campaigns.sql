select
  id as id,
  name as name
from
  {{ var('campaigns_table') }}
