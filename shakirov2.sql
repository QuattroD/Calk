Create table aircrafts 
(aircraft_code char(3) not null,
model text not null,
range integer not null, 
check (range > 0),
primary key (aircraft_code)
);

create table seats
(aircraft_code char(3) not null,
 seat_no varchar(4) not null,
 fare_conditions varchar(10) not null,
 check (fare_conditions in ('Economy', 'Comfort', 'Business')),
 primary key(aircraft_code, seat_no),
 foreign key(aircraft_code)
 references aircrafts(aircraft_code) on delete cascade
);

--drop table aircrafts;

Insert into aircrafts (aircraft_code, model, range )
values ('s13', 'sukhoi superjet-100', 3000),
	   ('s10', 'sukhoi superjet-101', 3001),
	   ('s11', 'sukhoi superjet-102', 3002),
	   ('s12', 'sukhoi superjet-103', 3003);

--Select aircraft_code, model, range from aircrafts;

Select * from aircrafts;

Select model, aircraft_code, range from aircrafts
order by range

Select * from aircrafts
where range >= 3001 and range <= 3003;

Update aircrafts
set range = range+1
where range = 3001

Delete from aircrafts
where aircraft_code = 's10'



Insert into seats (aircraft_code, seat_no, fare_conditions )
values ('s10', '1A', 'Business'),
	   ('s10', '1AB', 'Economy'),
	   ('s11', '1BC', 'Comfort'),
	   ('s12', '2A', 'Comfort');

``