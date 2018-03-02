with country as (

  select * from {{ref('FB_INSIGHTS_COUNTRY')}}

), age as (

  select * from {{ref('FB_INSIGHTS_AGE')}}

), gender as (

  select * from {{ref('FB_INSIGHTS_GENDER')}}

), placement as (

  select * from {{ref('FB_INSIGHTS_PLACEMENTS')}}

), platform as (

  select * from {{ref('FB_INSIGHTS_PLATFORMS')}}

), device as (

  select * from {{ref('FB_INSIGHTS_DEVICES')}}

)

select * from country
union all
select * from age
union all
select * from gender
union all
select * from placement
union all
select * from platform
union all
select * from device
