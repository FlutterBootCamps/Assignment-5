create table passenger (
  id bigint primary key generated always as identity,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  date_of_birth date not null,
  country_of_citizenship varchar(50) not null,
  country_of_residence varchar(50) not null,
  passport_number varchar(20) not null,
  Created_At timestamp not null,
  Updated_At timestamp not null
);

create table airport (
  id bigint primary key generated always as identity,
  airport_name varchar(50),
  country varchar(50),
  state varchar(50),
  city varchar(50),
  Created_At timestamp not null,
  Updated_At timestamp not null
)

create table airline (
  id bigint primary key generated always as identity,
  airline_code varchar,
  airline_name varchar,
  airline_country varchar(50),
  Created_At timestamp not null,
  Updated_At timestamp not null
);

create table flight (
  flight_id bigint primary key generated always as identity,
  departing_gate varchar(20) not null,
  arriving_gate varchar(20) not null,
  Created_At timestamp not null,
  Updated_At timestamp not null,
  airline_id bigint references airline(id) not null,
  departing_airport bigint references airport(id) not null,
  arriving_airport bigint references airport(id) not null
);

create table no_fly_list (
  id bigint primary key generated always as identity,
  active_from date not null,
  active_to date not null,
  no_fly_reason varchar(255),
  Created_At timestamp not null,
  Updated_At timestamp not null,
  psgnr_id bigint references passenger(id)
);


create table security_check (
  id bigint primary key generated always as identity,
  check_result varchar(20) not null,
  comments varchar(65535) not null,
  Created_At timestamp not null,
  Updated_At timestamp not null,
  passenger_id bigint references passenger(id)
);

create table booking (
  bookingid bigint primary key generated always as identity,
  flight_id bigint not null,
  status varchar(20) not null,
  booking_platform varchar(20) not null,
  Created_At timestamp not null,
  Updated_At timestamp not null,
  passenger_id bigint references passenger(id)
);

create table flight_manifest (
  id bigint primary key generated always as identity,
  Created_At timestamp not null,
  Updated_At timestamp not null,
  booking_id bigint references booking(bookingid),
  flight_id bigint references flight(flight_id)
);

create table boarding_pass (
  id bigint primary key generated always as identity,
  qr_code varchar(65535) not null,
  Created_At timestamp not null,
  Updated_At timestamp not null,
  booking_id bigint references booking(bookingid)
);


create table baggage (
  id bigint primary key generated always as identity,
  weight_in_kg decimal(4,2),
  Created_At timestamp not null,
  Updated_At timestamp not null,
  booking_id bigint references booking(bookingid)
);

create table baggage_check (
  id bigint primary key generated always as identity,
  chech_result varchar(50) not null,
  Created_At timestamp not null,
  Updated_At timestamp not null,
  booking_id bigint references booking(bookingid),
  passanger_id bigint references passenger(id)
);