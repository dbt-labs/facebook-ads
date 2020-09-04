{% macro _get_facebook_ads_namespaces() %}
  {% set override_namespaces = var('facebook_ads_dispatch_list', []) %}
  {% do return(override_namespaces + ['facebook_ads']) %}
{% endmacro %}
