{% macro capitalize_name(first_col, last_col) -%}
    concat(
        upper(left(trim({{ first_col }}), 1)) + lower(substring(trim({{ first_col }}), 2, len(trim({{ first_col }})))),
        ' ',
        upper(left(trim({{ last_col }}), 1)) + lower(substring(trim({{ last_col }}), 2, len(trim({{ last_col }}))))
    )
{%- endmacro %}