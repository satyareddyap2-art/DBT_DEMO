with trips as (
    select 
    ride_id,
    rideable_type,
    date(to_timestamp(started_at)) as trip_date,
    start_station_id,
    end_station_id,
    member_casual,
    timestampdiff(seconds,to_timestamp(started_at),to_timestamp(ended_at)) as Trip_duration_seconds
    from {{source('demo','bike')}} where ride_id != 'ride_id'
)
select * from trips 