create or replace table Final_table_frAnalysis as (
select fac.trip_id,
fac.VendorID, dt.tpep_pickup_datetime, dt.tpep_dropoff_datetime, pas.passenger_count,tr.trip_distance, 
roc.rate_code_name,loc.PULocationID,loc.DOLocationID, pay.payment_type_name, fac.fare_amount, fac.extra, fac.mta_tax, fac.tip_amount, fac.tolls_amount, fac.improvement_surcharge, fac.total_amount

from fact_table as fac
join datetime_dim as dt on fac.datetime_id = dt.datetime_id
join location_dim as loc on loc.location_id = fac.location_id
join passenger_count_dim as pas on fac.passenger_count_id = pas.passenger_count_id
join payment_type_dim as pay on fac.payment_type_id = pay.payment_type_id
join rate_code_dim as roc on fac.rate_code_id = roc.rate_code_id
join trip_distance_dim as tr on fac.trip_distance_id = tr.trip_distance_id
);