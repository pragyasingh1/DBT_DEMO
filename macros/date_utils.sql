{% macro get_season(x) %}

CASE WHEN MONTH(TO_TIMESTAMP({{x}})) in (4,5,6)
THEN 'SUMMER'
WHEN MONTH(TO_TIMESTAMP({{x}}))  in (10,11,12,1)
THEN 'WINTER'
WHEN MONTH(TO_TIMESTAMP({{x}}))  in (7,8,9)
THEN 'RAINY'
ELSE 'SPRING'
END

{% endmacro %}

{% macro day_type(x) %}

CASE
WHEN DAYNAME(TO_TIMESTAMP({{x}})) in ('Sat','Sun')
THEN 'Weekend'
ELSE 'Businessday'
END

{% endmacro %}