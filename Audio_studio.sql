create table studio
(code_studio int not null,
_name varchar(30) not null,
_address varchar(30) not null,
number_phone int not null,
primary key(code_studio)
);

create table producer
(
code_producer int not null,
_name varchar(30) not null,
surname varchar(30) not null,
number_phone int not null,
email varchar(30) not null,
primary key(code_producer)
);

create table executor
(code_executor int not null,
_name varchar(30) not null,
surname varchar(30) not null,
_label varchar(30) not null,
phone int not null,
primary key(code_executor)
);

create table music
(code_music int not null,
_data date not null,
outlet varchar(50) not null,
genre varchar(30) not null,
primary key (code_music)
);

create table album
(code_album int not null,
code_music int not null,
code_executor int not null,
_data date not null,
outlet varchar(50) not null,
primary key (code_album),
foreign key(code_music)
references music(code_music) on delete cascade,
foreign key(code_executor)
references executor(code_executor) on delete cascade
);