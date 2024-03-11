-- Supabase AI is experimental and may produce incorrect answers
-- Always verify the output before executing

-- Supabase AI is experimental and may produce incorrect answers
-- Always verify the output before executing

-- Supabase AI is experimental and may produce incorrect answers
-- Always verify the output before executing

-- create table
--   security_check (
--     id bigint primary key generated always as identity,
--     check_result varchar(20),
--     comments varchar(65535),
--     created_at timestamp,
--     updated_at timestamp
--   );
-- create table
--   baggage_check (
--     id bigint primary key generated always as identity,
--     check_result varchar(50),
--     created_at bigint,
--     updated_at bigint
--   );
-- create table
--   booking (
--     bookingid bigint primary key generated always as identity,
--     flight_id bigint,
--     status varchar(20),
--     booking_platform varchar(20),
--     created_at timestamp,
--     updated_at timestamp
--   );
-- create table
--   passengers (
--     id bigint primary key generated always as identity,
--     first_name varchar(50),
--     last_name varchar(50),
--     date_of_birth date,
--     country_of_citizenship varchar(50),
--     country_of_residence varchar(50),
--     passport_number varchar(20),
--     created_at timestamp,
--     updated_at timestamp
--   );
-- create table
--   no_fly_list (
--     id bigint primary key generated always as identity,
--     active_from date,
--     active_to date,
--     no_fly_reason varchar(255),
--     created_at timestamp,
--     updated_at timestamp
--   );
-- create table
--   flights (
--     flight_id bigint primary key generated always as identity,
--     departing_gate varchar(20),
--     arriving_gate varchar(20),
--     created_at timestamp,
--     updated_at timestamp
--   );
-- create table
--   baggage (
--     id bigint primary key generated always as identity,
--     weight_in_kg decimal(4, 2),
--     created_date timestamp,
--     ubdate_date timestamp
--   );
-- create table
--   flight_manifest (
--     id bigint primary key generated always as identity,
--     created_at timestamp,
--     updated_at timestamp
--   );
-- create table
--   boarding_pass (
--     id bigint primary key generated always as identity,
--     qr_code varchar(65535),
--     created_at timestamp,
--     updated_at timestamp
--   );
-- create table
--   airline (
--     id bigint primary key generated always as identity,
--     airline_code varchar,
--     airline_name bigint,
--     airline_country varchar(50),
--     created_at timestamp,
--     updated_at timestamp
--   );
-- create table
--   airport (
--     id bigint primary key generated always as identity,
--     airport_name varchar(50),
--     country varchar(50),
--     state varchar(50),
--     city varchar(50),
--     created_at timestamp,
--     updated_at timestamp
--   );
alter table security_check
add column passengers_id bigint references passengers;

alter table baggage_check
add column passengers_id bigint references passengers;

alter table baggage_check
add column booking_id bigint references booking;

alter table booking
add column passengers_id bigint references passengers;

alter table no_fly_list
add column psgnr_id bigint references passengers;

alter table baggage
add column booking_id bigint references booking;

alter table flight_manifest
add column booking_id bigint references booking;

alter table flight_manifest
add column flight_id bigint references flights;

alter table boarding_pass
add column booking_id bigint references booking;

alter table flights
add column airline_id bigint references airline;

alter table flights
add column departing_airport bigint references airport;

alter table flights
add column arriving_airport bigint references airport;