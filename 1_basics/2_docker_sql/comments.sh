#run postgres
docker run -it \
-e POSTGRES_USER=root \
-e POSTGRES_PASSWORD=root \
-e POSTGRES_DB=ny_taxi \
-p 5432:5432 \
-v /root/projects/de-zoomcamp/paostgres_data:/var/lib/postgresql/data:rw \
postgres:13

#run pgcli
pgcli -h localhost -p 5432 -u root -d ny_taxi


Q1. Which tag has the following text? - Write the image ID to the file
--imageid string
--iidfile string
--idimage string
--idfile string


A1. --iidfile string          Write the image ID to the file

Q2.Understanding docker first run
Run docker with the python:3.9 image in an interactive mode and the entrypoint of bash. Now check the python modules that are installed ( use pip list). How many python packages/modules are installed?

1
6
3
7

A2. 3

Q3.Question 3. Count records
How many taxi trips were totally made on January 15?
Tip: started and finished on 2019-01-15.
A3.
root@localhost:ny_taxi> select count(*) from green_trip_data where lpep_pickup_datetime::date=date'2019-01-15' and lpep_dropoff_datetime::date=date'2019-01-15';
+-------+
| count |
|-------|
| 20530 |
+-------+
SELECT 1
Time: 0.084s

Q4. Largest trip for each day
Which was the day with the largest trip distance Use the pick up time for your calculations.

root@localhost:ny_taxi> select lpep_pickup_datetime::date, max(trip_distance) from green_trip_data GROUP BY 1 order by 2 desc limit 1;
+----------------------+--------+
| lpep_pickup_datetime | max    |
|----------------------+--------|
| 2019-01-15           | 117.99 |
+----------------------+--------+
SELECT 1
Time: 0.229s


Question 5. The number of passengers
In 2019-01-01 how many trips had 2 and 3 passengers?

2: 1282 ; 3: 266
2: 1532 ; 3: 126
2: 1282 ; 3: 254
2: 1282 ; 3: 274

root@localhost:ny_taxi> select passenger_count,count(*) from green_trip_data where lpep_pickup_datetime::date=date'2019-01-01' and passenger_count in (2,3) group by 1;
+-----------------+-------+
| passenger_count | count |
|-----------------+-------|
| 2               | 1282  |
| 3               | 254   |
+-----------------+-------+
SELECT 2
Time: 0.121s

Question 6. Largest tip
For the passengers picked up in the Astoria Zone which was the drop off zone that had the largest tip? We want the name of the zone, not the id.

Note: it's not a typo, it's tip , not trip

A6.
root@localhost:ny_taxi> select z2."Zone",tip_amount,max(tip_amount) OVER () mx from green_trip_data t join zones z1 on t."PULocationID"=z1."Location
 ID" join zones z2 on t."DOLocationID"=z2."LocationID"  where z1."Zone"='Astoria' order by tip_amount desc limit 1;
+-------------------------------+------------+------+
| Zone                          | tip_amount | mx   |
|-------------------------------+------------+------|
| Long Island City/Queens Plaza | 88.0       | 88.0 |
+-------------------------------+------------+------+
SELECT 1
Time: 0.640s
root@localhost:ny_taxi>




Hi everyone. Good chance to start this year with learning something new and refresh your knowledges in dataengineering area with 
#data-engineering-zoomcamp - free dataengineering course
I'm in.
Thx, Alexey Grigorev

1st week mostly devoted to Docker and setting up dev environment. I haven't used Windows in a two years and was pleasantly surprised by how much wsl has evolved. Not bad Microsoft, not bad).