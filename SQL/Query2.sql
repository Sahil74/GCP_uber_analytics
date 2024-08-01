-- Find the total number of trips by passenger count
select pas.passenger_count, count(fac.trip_id) as cu from `uber_data.fact_table` as fac
join `uber_data.passenger_count_dim` as pas
on fac.passenger_count_id = pas.passenger_count_id
group by pas.passenger_count
order by cu desc
limit 5;