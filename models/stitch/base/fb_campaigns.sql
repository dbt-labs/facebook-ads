select
  id as id,
  name as name
from
  {{ var('facebook_ads_schema') }}.{{ var('campaigns_table') }}
