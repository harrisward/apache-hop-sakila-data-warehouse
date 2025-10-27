-- dwh.dim_actor definition

-- Drop table

-- DROP TABLE dwh.dim_actor;

CREATE TABLE dwh.dim_actor (
	actor_tk int4 NULL,
	"version" int4 NULL,
	date_from timestamp NULL,
	date_to timestamp NULL,
	actor_id int4 NULL,
	actor_first_name varchar(45) NULL,
	actor_last_name varchar(45) NULL,
	actor_last_update timestamp NULL,
	actor_full_name varchar(100) NULL
);
CREATE INDEX idx_dim_actor_lookup ON dwh.dim_actor USING btree (actor_id);
CREATE INDEX idx_dim_actor_tk ON dwh.dim_actor USING btree (actor_tk);


-- dwh.dim_customer definition

-- Drop table

-- DROP TABLE dwh.dim_customer;

CREATE TABLE dwh.dim_customer (
	customer_tk int4 NULL,
	"version" int4 NULL,
	date_from timestamp NULL,
	date_to timestamp NULL,
	customer_id int4 NULL,
	customer_full_name varchar(100) NULL,
	customer_active varchar(3) NULL,
	customer_country varchar(50) NULL,
	customer_city varchar(50) NULL,
	customer_phone varchar(20) NULL,
	customer_postal_code varchar(10) NULL,
	customer_district varchar(20) NULL,
	customer_address varchar(50) NULL,
	customer_last_update timestamp NULL,
	customer_email varchar(50) NULL,
	customer_last_name varchar(45) NULL,
	customer_first_name varchar(45) NULL
);
CREATE INDEX idx_dim_customer_lookup ON dwh.dim_customer USING btree (customer_id);
CREATE INDEX idx_dim_customer_tk ON dwh.dim_customer USING btree (customer_tk);


-- dwh.dim_date definition

-- Drop table

-- DROP TABLE dwh.dim_date;

CREATE TABLE dwh.dim_date (
	date_tk varchar(8) NULL,
	day_of_month int4 NULL,
	month_of_year int4 NULL,
	"YEAR" int4 NULL,
	month_of_year_description varchar(24) NULL
);


-- dwh.dim_film definition

-- Drop table

-- DROP TABLE dwh.dim_film;

CREATE TABLE dwh.dim_film (
	film_tk int4 NULL,
	film_travel_category varchar(3) NULL,
	film_sports_category varchar(3) NULL,
	film_scifi_category varchar(3) NULL,
	film_new_category varchar(3) NULL,
	film_music_category varchar(3) NULL,
	film_horror_category varchar(3) NULL,
	film_games_category varchar(3) NULL,
	film_foreign_category varchar(3) NULL,
	film_family_category varchar(3) NULL,
	film_drama_category varchar(3) NULL,
	film_documentary_category varchar(3) NULL,
	film_comedy_category varchar(3) NULL,
	film_classics_category varchar(3) NULL,
	film_children_category varchar(3) NULL,
	film_animation_category varchar(3) NULL,
	film_deleted_scenes varchar(3) NULL,
	film_commentaries varchar(3) NULL,
	film_behind_the_scenes varchar(3) NULL,
	film_trailers varchar(3) NULL,
	film_rating_description varchar(64) NULL,
	film_language varchar(20) NULL,
	film_last_update timestamp NULL,
	film_rating varchar(5) NULL,
	film_replacement_cost numeric(9, 2) NULL,
	film_length int4 NULL,
	film_rental_rate numeric(8, 2) NULL,
	film_rental_duration int4 NULL,
	film_release_year int4 NULL,
	film_description varchar(16383) NULL,
	film_title varchar(128) NULL,
	film_id int4 NULL
);
CREATE INDEX idx_dim_film_lookup ON dwh.dim_film USING btree (film_id);
CREATE UNIQUE INDEX idx_dim_film_pk ON dwh.dim_film USING btree (film_tk);


-- dwh.dim_film_actor_bridge definition

-- Drop table

-- DROP TABLE dwh.dim_film_actor_bridge;

CREATE TABLE dwh.dim_film_actor_bridge (
	film_tk int4 NULL,
	actor_tk int4 NULL
);
CREATE INDEX idx_dim_film_actor_bridge_lookup ON dwh.dim_film_actor_bridge USING btree (film_tk, actor_tk);


-- dwh.dim_staff definition

-- Drop table

-- DROP TABLE dwh.dim_staff;

CREATE TABLE dwh.dim_staff (
	staff_tk int4 NULL,
	"version" int4 NULL,
	date_from timestamp NULL,
	date_to timestamp NULL,
	staff_id int4 NULL,
	staff_country varchar(50) NULL,
	staff_city varchar(50) NULL,
	staff_phone varchar(20) NULL,
	staff_postal_code varchar(10) NULL,
	staff_district varchar(20) NULL,
	staff_address varchar(50) NULL,
	staff_full_name varchar(100) NULL,
	staff_active varchar(3) NULL,
	staff_last_update timestamp NULL,
	staff_email varchar(50) NULL,
	staff_last_name varchar(45) NULL,
	staff_first_name varchar(45) NULL
);
CREATE INDEX idx_dim_staff_lookup ON dwh.dim_staff USING btree (staff_id);
CREATE INDEX idx_dim_staff_tk ON dwh.dim_staff USING btree (staff_tk);


-- dwh.dim_store definition

-- Drop table

-- DROP TABLE dwh.dim_store;

CREATE TABLE dwh.dim_store (
	store_tk int4 NULL,
	"version" int4 NULL,
	date_from timestamp NULL,
	date_to timestamp NULL,
	store_id int4 NULL,
	store_manager_full_name varchar(100) NULL,
	store_country varchar(50) NULL,
	store_city varchar(50) NULL,
	store_phone varchar(20) NULL,
	store_postal_code varchar(10) NULL,
	store_district varchar(20) NULL,
	store_address varchar(50) NULL,
	store_active bool NULL,
	store_email varchar(50) NULL,
	store_manager_last_name varchar(45) NULL,
	store_manager_first_name varchar(45) NULL,
	store_last_update timestamp NULL
);
CREATE INDEX idx_dim_store_lookup ON dwh.dim_store USING btree (store_id);
CREATE INDEX idx_dim_store_tk ON dwh.dim_store USING btree (store_tk);


-- dwh.dim_time definition

-- Drop table

-- DROP TABLE dwh.dim_time;

CREATE TABLE dwh.dim_time (
	time_tk varchar(8) NULL,
	time_description varchar(10) NULL,
	"HOUR" int4 NULL,
	"MINUTE" int4 NULL,
	"SECOND" int4 NULL,
	am_pm text NULL
);


-- dwh.fact_rentals definition

-- Drop table

-- DROP TABLE dwh.fact_rentals;

CREATE TABLE dwh.fact_rentals (
	rental_id int4 NULL,
	rental_date_tk varchar(8) NULL,
	return_date_tk varchar(8) NULL,
	rental_time_tk varchar(6) NULL,
	return_time_tk varchar(6) NULL,
	rental_duration int4 NULL,
	customer_tk int4 NULL,
	staff_tk int4 NULL,
	store_tk int4 NULL,
	film_tk int4 NULL
);
CREATE INDEX idx_fact_rentals_lookup ON dwh.fact_rentals USING btree (rental_id);