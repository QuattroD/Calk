create table pacient
(
id_pacient int not null,
number_history_desease int not null,
FIO text not null,
adress text not null,
phone text not null,
primary key (id_pacient)

);

create table specialist
(
id_specialist int not null,
number_phone_spec int not null,
FIO_spec text not null,
specialnost text not null,
adress text not null,
phone text not null,
primary key (id_specialist)
);

create table visits
(
code_visits int not null,
id_pacient int not null,
id_specialist int not null,
data_visit text not null,
anamnez text not null,
diagnoz text not null,
lechenie text not null,
stoimost_rashodov_materialov int not null,
stoimost_rashodov_lecheniya int not null,
stoimost_uslug int not null,
primary key(code_visits), 
foreign key (id_specialist)
references specialist(id_specialist) on delete cascade,
foreign key (id_pacient)
references pacient(id_pacient) on delete cascade
);

Insert into pacient
values (1, 1, 'ivanpiskin', 'bari galeeva3', '8939393939'),
	   (2, 2, 'anselgolubkin', 'bari galeeva3', '8939393939'),
	   (3, 3, 'shakirovloh', 'bari galeeva3', '8939393939'),
	   (4, 4, 'niyazpidoras', 'bari galeeva3', '8939393939');

Insert into specialist
values (1, 1, 'ivanpiskin', 'test1', 'bari galeeva3', '8939393939'),
	   (2, 2, 'anselgolubkin', 'test1', 'bari galeeva3', '8939393939'),
	   (3, 3,'shakirovloh', 'test1', 'bari galeeva3', '8939393939'),
	   (4, 4, 'niyazpidoras', 'test1', 'bari galeeva3', '8939393939');

Insert into visits
values (1, 2, 3, '21.01.22', 'ucheba', 'ucheba', 'uzi', 7000, 13000, 5000),
	   (2, 1, 4, '22.01.22', 'impotent', 'impotent', 'glock', 13000, 2000, 5000),
	   (3, 4, 2, '23.01.22', 'serdcestop', 'serdcestop', 'ak-47', 20000, 8000, 5000),
	   (4, 1, 3, '24.01.22', 'krutost', 'krutost', 'm4a1', 15000, 80000, 5000);

select * from pacient
select * from specialist
select * from visits

delete from pacient 
where id_pacient = 1