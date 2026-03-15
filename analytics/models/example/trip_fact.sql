with trips as (
    select 
    ride_id,
    date(to_timestamp(started_at)) as trip_date,
    start_statio_id,
    end_station_id,
    member_csual,
    timestampdiff(seconds,to_timestamp(started_at),to_timestamp(ended_at)) as Trip_duration_seconds
    from {{ref('stg_bike')}} where ride_id != 'bike_id'
)
select * from trips 