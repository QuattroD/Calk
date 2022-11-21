create table tovar
(code_tovar int not null,
country text not null,
mark_avto text not null,
model text not null,
color text not null,
stock_available varchar(30) not null,
check(stock_available in ('yes', 'no', 'when it will be')),
price int not null,
primary key(code_tovar)
);

--alter table tovar
--alter column stock_available varchar(30) not null;

create table tech_detail
(
code_detail int not null,
code_tovar int not null,
body_type text not null,
number_of_doors int not null,
number_of_seats int not null,
type_motor text not null,
engine_layot text not null,
engine_displacement int not null,
primary key(code_detail),
foreign key(code_tovar)
references tovar(code_tovar) on delete cascade
);

create table client
(code_client int not null,
FIO text not null, 
passport_data text not null,
address1 text not null,
phone text not null,
primary key(code_client)
);

create table buy
(ID_Buy int not null,
code_tovar int not null,
code_client int not null,
_data date not null,
delievery varchar not null,
check(delievery in ('yes', 'no')),
type_payment varchar not null,
check(type_payment in ('enumeration', 'in cash', 'credit', 'straightaway')),
primary key(ID_Buy),
foreign key(code_tovar)
references tovar(code_tovar) on delete cascade,
foreign key(code_client)
references client(code_client) on delete cascade
);

Insert into tovar
values ('1', 'russia', 'mazda', 'Bx1', 'white', 'yes', '150000'),
	   ('2', 'england', 'mazda', 'Bx2', 'black', 'no', '170000'),
	   ('3', 'germany', 'tayota', 'gh2', 'yellow', 'when it will be', '120000'),
	   ('4', 'germany', 'bmw', 'x6', 'blue', 'yes', '300000');

Insert into tech_detail
values (1, 1, 'hatchback', 4, 5, 'primary', 'bottom', 15),
	   (2, 2, 'hatchback', 2, 4, 'primary', 'bottom', 13),
	   (3, 3, 'sedan', 4, 4, 'secondary', 'bottom', 12),
	   (4, 4, 'sedan', 2, 4, 'secondary', 'bottom', 30);

Insert into client
values (1, 'test', '214513 5435435', 'marshal', '79083432324'),
	   (2, 'test2', '342432 32432', 'yamasheva', '7908653324'),
	   (3, 'test3', '2313 324232', 'ershova', '79345354343'),
	   (4, 'test4', '254 4324324', 'sovetskaya', '79083242323');

Insert into buy
values (1, 2, 3, '07.07.22', 'yes', 'credit'),
	   (2, 1, 4, '14.07.22', 'no', 'in cash'),
	   (3, 4, 2, '21.07.22', 'yes', 'enumeration'),
	   (4, 1, 3, '28.07.22', 'yes', 'straightaway');


select * from tovar
select * from buy
select * from client
select * from tech_detail

delete from client 
where code_client = 3