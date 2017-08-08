with base as (

  select
    id,
    lower(nullif(url_tags, '')) as url_tags,
    lower(coalesce(
      nullif(object_story_spec__link_data__call_to_action__value__link, ''),
      nullif(object_story_spec__video_data__call_to_action__value__link, ''),
      nullif(object_story_spec__link_data__link, '')
    )) as url
  from
    {{ var('ad_creatives_table') }}

), splits as (

  select
    id,
    url,
    split_part(url ,'?', 1) as base_url,
    --this is a strange thing to have to do but it's because sometimes the URL exists on the story object and we wouldn't get the appropriate UTM params here otherwise
    coalesce(url_tags, split_part(url ,'?', 2)) as url_tags
  from base

)

select
  *,
  split_part(split_part(url_tags,'utm_source=',2), '&', 1) as utm_source,
  split_part(split_part(url_tags,'utm_medium=',2), '&', 1) as utm_medium,
  split_part(split_part(url_tags,'utm_campaign=',2), '&', 1) as utm_campaign,
  split_part(split_part(url_tags,'utm_content=',2), '&', 1) as utm_content,
  split_part(split_part(url_tags,'utm_term=',2), '&', 1) as utm_term
from splits
