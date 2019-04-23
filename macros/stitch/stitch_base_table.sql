{% macro stitch_base_table(tablename, partition_fields=['id']) %}

    {{ adapter_macro('facebook_ads.stitch_base_table', tablename, partition_fields) }}

{% endmacro %}


{% macro default__stitch_base_table(tablename, partition_fields=['id']) %}

    {{tablename}}

{% endmacro %}


{% macro bigquery__stitch_base_table(tablename, partition_fields=['id']) %}

    (select * 
    from (

        select 
            *,
            row_number() over (partition by {{ partition_fields|join(',') }} order by _sdc_sequence desc) = 1 as is_last_stitch_record
        from {{tablename}}

    )
    where is_last_stitch_record = True) a

{% endmacro %}