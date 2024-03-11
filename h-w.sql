create table
  passengers (
    id bigint primary key,
    first_name varchar(50),
    last_name varchar(50),
    date_of_birth date,
    country_of_citizenship varchar(50),
    country_of_residence varchar(50),
    passport_number varchar(20),
    created_at timestamp,
    updated_at timestamp
  );
  
  create table
  security_check (
    id bigint primary key generated always as identity,
    check_result text,
    comments text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    passenger_id bigint references passengers (id)
  );

create table if not exists
  no_fly_list (
    id bigint primary key generated always as identity,
    active_from timestamp with time zone,
    active_to timestamp with time zone,
    no_fly_reason text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    psgnr_id bigint references passengers 
  );
  
create table
  flight (
    flight_id SERIAL primary key,
    departing_gate varchar(20) not null,
    arriving_gate varchar(20) not null,
    Created_At timestamp not null,
    Updated_At timestamp not null,
    airline_id bigint references airline (id) not null,
    departing_airport bigint references airport (id) not null,
    arriving_airport bigint references airport (id) not null
  );
  
create table flight_manifest (
  id SERIAL primary key,
  Created_At timestamp not null,
  Updated_At timestamp not null,
  booking_id bigint references booking(bookingid),
  flight_id bigint references flight(flight_id)
);
  
create table booking (
  bookingid SERIAL primary key,
  flight_id bigint not null,
  status varchar(20) not null,
  booking_platform varchar(20) not null,
  Created_At timestamp not null,
  Updated_At timestamp not null,
  passenger_id bigint references passengers(id)
);
  
create table boarding_pass (
  id SERIAL primary key,
  qr_code varchar(65535) not null,
  Created_At timestamp not null,
  Updated_At timestamp not null,
  booking_id bigint references booking(bookingid)
);
  
create table baggage (
  id SERIAL primary key,
  weight_in_kg decimal(4,2),
  Created_At timestamp not null,
  Updated_At timestamp not null,
  booking_id bigint references booking(bookingid)
);
  
create table baggage_check (
  id SERIAL primary key,
  chech_result varchar(50) not null,
  Created_At timestamp not null,
  Updated_At timestamp not null,
  booking_id bigint references booking(bookingid),
  passanger_id bigint references passengers(id)
);
  
create table
  airport (
    id SERIAL primary key,
    airport_name varchar(50) not null,
    country varchar(50) not null,
    state varchar(50) not null,
    city varchar(50) not null,
    created_at timestamp not null,
    updated_at timestamp not null
  );
  
create table
  airline (
    id bigint primary key,
    airline_code varchar,
    airline_name bigint,
    airline_country varchar(50),
    created_at timestamp,
    updated_at timestamp
  );
  