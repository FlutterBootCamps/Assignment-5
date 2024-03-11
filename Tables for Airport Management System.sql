create table
  baggage_check (
    id bigint primary key generated always as identity,
    check_result varchar(50) not null,
    created_at bigint not null,
    update_al bigint not null
  );

ALTER table
  baggage_check
ADD column
  booking_id bigint references booking;

ALTER table
  baggage_check
ADD column
  passenger_id bigint references passengers;

create table
  on_fly_list (
    id bigint primary key generated always as identity,
    active_from date not null,
    active_on date not null,
    no_fly_reason varchar(255) not null,
    created_at timestamp not null,
    updated_at timestamp not null
  );

alter table
  on_fly_list
add column
  psgnr_id bigint references passengers;

create table
  security_check (
    id bigint primary key generated always as identity,
    check_result varchar(20) not null,
    comments varchar(65535),
    created_at timestamp not null,
    updated_at timestamp not null
  );

alter table
  security_check
add column
  passenger_id bigint references passengers;

create table
  booking (
    bookingid bigint primary key generated always as identity,
    filght_id bigint not null,
    status varchar(20) not null,
    booking_platform varchar(20) not null,
    created_at timestamp not null,
    updated_at timestamp not null
  );

alter table
  booking
add column
  psgnr_id bigint references passengers;

create table
  passengers (
    id bigint primary key generated always as identity,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    date_of_birth date not null,
    country_of_citizenship varchar(50) not null,
    country_of_residence varchar(50) not null,
    passport_number varchar(20) not null,
    created_at timestamp not null,
    updated_at timestamp not null
  );

create table
  baggage (
    id bigint primary key generated always as identity,
    weight_in_kg decimal(4, 2) not null,
    created_date timestamp not null,
    updated_date timestamp not null
  );

alter table
  baggage
add column
  booking bigint references booking;

create table
  flight (
    flight_id bigint primary key generated always as identity,
    departing_gate varchar(20) not null,
    arriving_gate varchar(20) not null,
    created_at timestamp not null,
    updated_at timestamp not null
  );

alter table
  flight
add column
  airline_id bigint references airline;

alter table
  flight
add column
  departing_airport_id bigint references airport;

alter table
  flight
add column
  arriving_airport_id bigint references airport;

create table
  flight_manifest (
    id bigint primary key generated always as identity,
    created_at timestamp not null,
    updated_at timestamp not null
  );

--  alter table flight_manifest rename column flight_id to id;
alter table
  flight_manifest
add column
  booking_id bigint references booking;

alter table
  flight_manifest
add column
  flight_id bigint references flight;

create table
  airport (
    id bigint primary key generated always as identity,
    airport_name varchar(50) not null,
    country varchar(50) not null,
    state varchar(50) not null,
    city varchar(50) not null,
    created_at timestamp not null,
    updated_at timestamp not null
  );

create table
  airline (
    id bigint primary key generated always as identity,
    airline_code varchar not null,
    airline_name bigint not null,
    airline_country varchar(50) not null,
    created_at timestamp not null,
    updated_at timestamp not null
  );

create table
  boarding_pass (
    id bigint primary key generated always as identity,
    qr_code varchar(65535) not null,
    created_at timestamp not null,
    updated_at timestamp not null
  );

alter table
  boarding_pass
add column
  booking_id bigint references booking;
