drop database if exists linces;

create database linces;

use linces;

create table linces(
		id_lince	int primary key,
		nome_lince	varchar (50),
		genero		enum ("F", "M"),
		data_ini	date,
		data_obito	date,
		id_pai		int,
        foreign key (id_pai)
		references linces (id_lince)   
        on update cascade
        on delete restrict,
		
		id_mae		int,
		foreign key (id_mae)
		references linces (id_lince)
		on update cascade
        on delete restrict
);

create table tecnicos (
		num_tecnico	int primary key,
		nome_te 	varchar(50)
);

create table localizacao (
		id_lince int,
		foreign key (id_lince)
		references linces (id_lince)
		on update cascade
		on delete restrict,
		data_loc date,
		hora	 date,
		latitude varchar (50),
		longitude varchar (50),
		
		primary key (id_lince, data_loc, hora)
);

create table controles (
		id_lince 	int,
		foreign key (id_lince)
		references linces (id_lince)
		on update cascade
		on delete restrict,
		data_loc	date,
		num_tecnico	int,
		foreign key (num_tecnico)
		references linces (id_lince)
		on update cascade
		on delete restrict,
		
		peso		int,
		estado_saude	varchar(160),
		
		primary key (id_lince, data_loc)
);


