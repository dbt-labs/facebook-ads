select

    *,
    nullif(parse_json(creative):id, '')::varchar as creative__id

from {{ var('ads_table') }}
