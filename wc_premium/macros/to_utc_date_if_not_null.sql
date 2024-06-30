{% macro to_utc_date_if_not_null(date_column) %}

    case
    when {{date_column}} is not null
        and {{date_column}} <> ''
        and length({{date_column}}) = 10

        then toDate({{date_column}}, 'UTC')
    else
        null
    end

{% endmacro %}