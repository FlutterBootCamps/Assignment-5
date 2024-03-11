create table passengers (
    id bigint primary key generated always as identity,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    data_of_birth date,
    country_of_citizenship varchar(50) not null,
    country_of_residence varchar(50) not null,
    passport_number varchar(20) not null,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
  );

create table airline (
    id bigint primary key generated always as identity,
    airline_code varchar not null,
    airline_name bigint not null,
    airline_country varchar(50),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
  );

create table airport (
    id bigint primary key generated always as identity,
    airport_name varchar(50) not null,
    country varchar(50) not null,
    state varchar(50) not null,
    city varchar(50) not null,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
  );

create table booking(
    bookingid bigint primary key generated always as identity,
    flight_id bigint,
    status varchar(20),
    booking_platform varchar(20),
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    passenger_id bigint references passengers(id)
    );

create table baggage_check(
    id bigint primary key generated always as identity,
    check_result varchar(50),
    created_at bigint not null,
    updated_at bigint not null,
    booking_id bigint references booking(bookingid),
    passenger bigint references passengers(id)
    );

create table security_check(
    id bigint primary key generated always as identity,
    check_result varchar(20),
    comment varchar(65535),
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    passenger_id bigint references passengers(id)
    );

create table baggage(
    id bigint primary key generated always as identity,
    weight_in_kg decimal(4,2),
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    booking_id bigint references booking(bookingid)
);

create table flights(
  flight_id bigint primary key generated always as identity,
  departing_gate varchar(20),
  arriving_gate varchar(20),
  created_at timestamp with time zone,
  updated_at timestamp with time zone,
  airline_id bigint references airline(id),
  departing_airport_id bigint references airport(id),
  arriving_airport_id bigint references airport(id)
  );

create table no_fly_list(
  id bigint primary key generated always as identity,
  active_from date,
  active_to date,
  no_fly_reason varchar(255),
  created_at timestamp with time zone,
  updated_at timestamp with time zone,
  psgnr_id bigint references passengers(id)
  );

create table boarding_pass(
  id bigint primary key generated always as identity,
  qr_code varchar(65535),
  created_at timestamp with time zone,
  updated_at timestamp with time zone,
  booking_id bigint references booking(bookingid)
  );

create table flight_manifest(
  id bigint primary key generated always as identity,
  created_at timestamp with time zone,
  updated_at timestamp with time zone,
  booking_id bigint references booking(bookingid),
  flight_id bigint references flights(flight_id)
  );