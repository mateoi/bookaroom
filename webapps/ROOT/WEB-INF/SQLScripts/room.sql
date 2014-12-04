drop table if exists rooms; 
CREATE TABLE rooms (
	room_id int not null
	name varchar(255),
	size int(255),
	location varchar(255),
	equipment text,
	rating tinyint,
	review text,
	rank enum("Normal","Premium"),
	primary key (room_id)
);