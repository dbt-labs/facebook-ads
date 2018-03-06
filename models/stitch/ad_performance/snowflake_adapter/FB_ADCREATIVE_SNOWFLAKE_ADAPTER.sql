select

    *,
    parse_json(object_story_spec):link_data:call_to_action:value:link::varchar as object_story_spec__link_data__call_to_action__value__link,
    parse_json(object_story_spec):video_data:call_to_action:value:link::varchar as object_story_spec__video_data__call_to_action__value__link,
    parse_json(object_story_spec):link_data:link::varchar as object_story_spec__link_data__link

from {{ var('ad_creatives_table') }}
