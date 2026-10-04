WITH daily_weather as (
    select
    date(time) as daily_weather,
    weather,
    temp,
    pressure,
    humidity,
    clouds
    from 
    {{source('demo','weather')}}
),

daily_weather_aggregate as (
    select 
    daily_weather,
    weather,
    round(avg(temp),2) avg_temp,
    round(avg(pressure),2) avg_pressure,
    round(avg(humidity),2) avg_humidity,
    round(avg(clouds),2) avg_clouds
    from daily_weather
    group by daily_weather,weather
    qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY COUNT(weather) desc) = 1
)

select * from daily_weather_aggregate