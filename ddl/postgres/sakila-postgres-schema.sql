-- source.actor definition

-- Drop table

-- DROP TABLE source.actor;

CREATE TABLE source.actor (
	actor_id int2 NULL,
	first_name varchar(45) NULL,
	last_name varchar(45) NULL,
	last_update timestamp NULL
);


-- source.address definition

-- Drop table

-- DROP TABLE source.address;

CREATE TABLE source.address (
	address_id int2 NULL,
	address varchar(50) NULL,
	address2 varchar(50) NULL,
	district varchar(20) NULL,
	city_id int2 NULL,
	postal_code varchar(10) NULL,
	phone varchar(20) NULL,
	last_update timestamp NULL
);


-- source.category definition

-- Drop table

-- DROP TABLE source.category;

CREATE TABLE source.category (
	category_id int2 NULL,
	"name" varchar(25) NULL,
	last_update timestamp NULL
);


-- source.city definition

-- Drop table

-- DROP TABLE source.city;

CREATE TABLE source.city (
	city_id int2 NULL,
	city varchar(50) NULL,
	country_id int2 NULL,
	last_update timestamp NULL
);


-- source.country definition

-- Drop table

-- DROP TABLE source.country;

CREATE TABLE source.country (
	country_id int2 NULL,
	country varchar(50) NULL,
	last_update timestamp NULL
);


-- source.customer definition

-- Drop table

-- DROP TABLE source.customer;

CREATE TABLE source.customer (
	customer_id int2 NULL,
	store_id int2 NULL,
	first_name varchar(45) NULL,
	last_name varchar(45) NULL,
	email varchar(50) NULL,
	address_id int2 NULL,
	active bool NULL,
	create_date timestamp NULL,
	last_update timestamp NULL
);


-- source.film definition

-- Drop table

-- DROP TABLE source.film;

CREATE TABLE source.film (
	film_id int2 NULL,
	title varchar(128) NULL,
	description varchar(16383) NULL,
	release_year timestamp NULL,
	language_id int2 NULL,
	original_language_id int2 NULL,
	rental_duration int2 NULL,
	rental_rate numeric(6, 2) NULL,
	length int2 NULL,
	replacement_cost numeric(7, 2) NULL,
	rating varchar(5) NULL,
	special_features varchar(54) NULL,
	last_update timestamp NULL
);


-- source.film_actor definition

-- Drop table

-- DROP TABLE source.film_actor;

CREATE TABLE source.film_actor (
	actor_id int2 NULL,
	film_id int2 NULL,
	last_update timestamp NULL
);


-- source.film_category definition

-- Drop table

-- DROP TABLE source.film_category;

CREATE TABLE source.film_category (
	film_id int2 NULL,
	category_id int2 NULL,
	last_update timestamp NULL
);


-- source.film_text definition

-- Drop table

-- DROP TABLE source.film_text;

CREATE TABLE source.film_text (
	film_id int2 NULL,
	title varchar(255) NULL,
	description varchar(16383) NULL
);


-- source.inventory definition

-- Drop table

-- DROP TABLE source.inventory;

CREATE TABLE source.inventory (
	inventory_id int4 NULL,
	film_id int2 NULL,
	store_id int2 NULL,
	last_update timestamp NULL
);


-- source."language" definition

-- Drop table

-- DROP TABLE source."language";

CREATE TABLE source."language" (
	language_id int2 NULL,
	"name" varchar(20) NULL,
	last_update timestamp NULL
);


-- source.payment definition

-- Drop table

-- DROP TABLE source.payment;

CREATE TABLE source.payment (
	payment_id int2 NULL,
	customer_id int2 NULL,
	staff_id int2 NULL,
	rental_id int4 NULL,
	amount numeric(7, 2) NULL,
	payment_date timestamp NULL,
	last_update timestamp NULL
);


-- source.rental definition

-- Drop table

-- DROP TABLE source.rental;

CREATE TABLE source.rental (
	rental_id int4 NULL,
	rental_date timestamp NULL,
	inventory_id int4 NULL,
	customer_id int2 NULL,
	return_date timestamp NULL,
	staff_id int2 NULL,
	last_update timestamp NULL
);


-- source.staff definition

-- Drop table

-- DROP TABLE source.staff;

CREATE TABLE source.staff (
	staff_id int2 NULL,
	first_name varchar(45) NULL,
	last_name varchar(45) NULL,
	address_id int2 NULL,
	email varchar(50) NULL,
	store_id int2 NULL,
	active bool NULL,
	username varchar(16) NULL,
	"password" varchar(40) NULL,
	last_update timestamp NULL
);


-- source.store definition

-- Drop table

-- DROP TABLE source.store;

CREATE TABLE source.store (
	store_id int2 NULL,
	manager_staff_id int2 NULL,
	address_id int2 NULL,
	last_update timestamp NULL
);