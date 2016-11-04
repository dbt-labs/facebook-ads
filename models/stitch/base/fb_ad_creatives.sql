with base as (

  select
    id,
    url_tags,
    coalesce(
      nullif(object_story_spec__link_data__call_to_action__value__link, ''),
      nullif(object_story_spec__video_data__call_to_action__value__link, '')
      nullif(object_story_spec__link_data__link, ''),
      nullif(link_url, ''),
    ) as url
  from
    {{ var('ad_creatives_table') }}

)

select
  *,
  split_part(url ,'?',1) as base_url,
  split_part(split_part(url_tags,'utm_source=',2), '&', 1) as utm_source,
  split_part(split_part(url_tags,'utm_medium=',2), '&', 1) as utm_medium,
  split_part(split_part(url_tags,'utm_campaign=',2), '&', 1) as utm_campaign,
  split_part(split_part(url_tags,'utm_content=',2), '&', 1) as utm_content,
  split_part(split_part(url_tags,'utm_term=',2), '&', 1) as utm_term
from base
