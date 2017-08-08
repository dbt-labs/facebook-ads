with country as (

  select * from {{ref('fb_insights_country')}}

), age as (

  select * from {{ref('fb_insights_age')}}

), gender as (

  select * from {{ref('fb_insights_gender')}}

), placement as (

  select * from {{ref('fb_insights_placements')}}

), platform as (

  select * from {{ref('fb_insights_platforms')}}

), device as (

  select * from {{ref('fb_insights_devices')}}

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
