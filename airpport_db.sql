
create table
  Passengers (
   id bigint primary key generated always as identity,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    date_of_birth date not null,
    country_of_citizenship varchar (50) not null,
    country_of_residence varchar (50) not null,
    passport_number varchar (20) not null,
    created_at timestamp not null,
    updated_at timestamp not null
  );

-----------------------------------
create table
  Security_check (
   id bigint primary key generated always as identity,
    check_result varchar(20),
    comments varchar(65535),
    created_at timestamp not null,
    updated_at timestamp not null,
    passenger_id bigint references passengers(id)
  );

-----------------------------------
create table
  No_fly_list (
   id bigint primary key generated always as identity,
   passenger_id bigint references passengers(id),
    active_from date not null,
    active_to date not null,
    no_fly_reason varchar(255),
    created_at timestamp not null,
    updated_at timestamp not null
    
  );

-----------------------------------
create table
 airline (
   id bigint primary key generated always as identity,
    airline_code varchar,
    airline_name varchar(50),
    created_at timestamp not null,
    updated_at timestamp not null
    
  );
-----------------------------------
create table
 airport (
   id bigint primary key generated always as identity,
    airport_name varchar(50),
    country varchar(50),
    state varchar(50),
    city varchar(50),
    created_at timestamp not null,
    updated_at timestamp not null
  );
-----------------------------------
create table
 flights (
   flights_id bigint primary key generated always as identity,
   airline_id  bigint references airline(id) not null,
   departing_airport_id  bigint references airport(id) not null,
   arriving_airport_id  bigint references airline(id) not null,
    departing_gate varchar(20) not null,
    arriving_gate varchar(20) not null,
    created_at timestamp not null,
    updated_at timestamp not null
  );
-----------------------------------
create table
 booking (
   bookingid bigint primary key generated always as identity,
   flight_id  bigint references flights(flights_id),
   Passengers_id  bigint references Passengers(id),
    status varchar(20) not null,
    booking_platform varchar(20),
    created_at timestamp not null
  );
  -----------------------------------
 create table
  flight_manifest (
    id bigint primary key generated always as identity,
    booking_id bigint references booking (bookingid),
    flight_id bigint references flights (flights_id),
    created_at timestamp not null,
    updated_at timestamp not null
  );
-----------------------------------
  create table
   boarding_pass(
    id bigint primary key generated always as identity,
    booking_id bigint references booking (bookingid),
    qr_code varchar(65535) not null,
    created_at timestamp not null,
    updated_at timestamp not null
  );

-----------------------------------
  create table 
  baggage(
    id bigint primary key generated always as identity,
    booking_id bigint references booking(bookingid),
    weight_in_kg decimal(4,2),
    create_date timestamp,
    updated_date  timestamp not null
  );
  -----------------------------------
  create table 
  baggage_check(
    id bigint primary key generated always as identity,
    booking_id bigint references booking(bookingid),
    passenger_id bigint references Passengers(id),
    check_result varchar(50),
    create_at timestamp not null,
    updated_at timestamp not null

  );