with daily_weather as (
select 
date(TIME) as Day_Weather,
WEATHER,
TEMP,
PRESSURE,
HUMIDITY,
CLOUDS 
from
 {{ source('demo_source', 'WEATHER') }}

),

daily_weather_agg as (
select 
Day_Weather,
WEATHER,
round(AVG(TEMP),2),
round(AVG(PRESSURE),2),
round(AVG(HUMIDITY),2),
round(AVG(CLOUDS),2)

from daily_weather
GROUP BY Day_Weather ,WEATHER

qualify ROW_NUMBER() OVER ( PARTITION BY Day_Weather order by COUNT(WEATHER) DESC )=1
)

SELECT * FROM daily_weather_agg