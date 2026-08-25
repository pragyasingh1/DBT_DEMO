select 
* from {{ source('demo_source', 'WEATHER') }}
limit 10