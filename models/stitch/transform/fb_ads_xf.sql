with ads as (

  select * from {{ref('fb_ads')}}

), d1 as (

  select
    *,
    count(*) over (partition by id rows between unbounded preceding and unbounded following) as num_versions,
    count(*) over (partition by id order by updated_at rows between unbounded preceding and current row) as version_number
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
