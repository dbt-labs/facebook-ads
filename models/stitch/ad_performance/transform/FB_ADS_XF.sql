with ads as (

  select * from {{ref('FB_ADS')}}

), d1 as (

  select
    *,
    count(*) over (partition by id) as num_versions,
    row_number() over (partition by id order by updated_at rows between unbounded preceding and current row) as version_number
  from ads

)

select
  *,
  case
    when version_number = 1 then created_at
    when version_number > 1 then updated_at
  end as effective_from,
  case
    when version_number = num_versions then null
    else lead(updated_at) over (partition by id order by updated_at)
  end as effective_to,
  md5(id || '|' || version_number) as unique_id
from d1
