with CTE as (
    select 
    TO_TIMESTAMP(STARTED_AT) as STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
    {{day_type('started_at')}} AS DAY_TYPE,
    {{get_season('started_at')}} as SEASON_OF_YEAR
from {{source('demo','bike')}}
where STARTED_AT != 'started_at')
select * from CTE