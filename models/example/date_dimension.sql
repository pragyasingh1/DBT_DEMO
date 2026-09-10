

with CTE as (
select TO_TIMESTAMP(time) as TIME,
DATE(TO_TIMESTAMP(time)) as DATE,
HOUR(TO_TIMESTAMP(time)) as HOUR_TIME,

{{day_type('time')}} AS DAY_TYPE ,

{{get_season('time')}} AS Station_Type

 from {{ source('demo_source', 'WEATHER') }}

)

select *from CTE