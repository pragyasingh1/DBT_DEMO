with CTE as (
select TO_TIMESTAMP(time) as TIME,
DATE(TO_TIMESTAMP(time)) as DATE,
HOUR(TO_TIMESTAMP(time)) as HOUR_TIME,

CASE
WHEN DAYNAME(TO_TIMESTAMP(time)) in ('Sat','Sun')
THEN 'Weekend'
ELSE 'Businessday'
END AS DAY_TYPE ,

CASE WHEN MONTH(TO_TIMESTAMP(time)) in (4,5,6)
THEN 'SUMMER'
WHEN MONTH(TO_TIMESTAMP(time)) in (10,11,12,1)
THEN 'WINTER'
WHEN MONTH(TO_TIMESTAMP(time)) in (7,8,9)
THEN 'RAINY'
ELSE 'SPRING'
END AS Station_Type

 from {{ source('demo_source', 'WEATHER') }}

)

select *from CTE