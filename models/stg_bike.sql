with bike as (
    select
    ride_id,
    trim(started_at,'"') started_at,
    trim(ended_at,'"') ended_at,
    trim(start_station_name,'"') start_station_name,
    start_statio_id,
    trim(end_station_name,'"') end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    trim(member_csual,'"') member_csual
    from {{ source('demo', 'bike') }}
)
select * from bike
