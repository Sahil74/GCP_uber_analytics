-- Find the top 10 pickup locations based on number of trips
select loc.PULocationID, count(fac.trip_id) as cu from `uber_data.fact_table` as fac
join `uber_data.location_dim` as loc on fac.location_id = loc.location_id
group by loc.PULocationID
order by cu desc;

-- Find the top 10 dropoff locations based on number of trips
select loc.DOLocationID, count(fac.trip_id) as cu from `uber_data.fact_table` as fac
join `uber_data.location_dim` as loc on fac.location_id = loc.location_id
group by loc.DOLocationID
order by cu desc;