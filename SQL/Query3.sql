-- Find the average fare amount by the day

select dt.drop_day, AVG(fac.fare_amount) as ag from `uber_data.fact_table` as fac
join `uber_data.datetime_dim` as dt
on fac.datetime_id = dt.datetime_id
group by dt.drop_day
order by ag desc;