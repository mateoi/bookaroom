droptable if exists users; 
CREATE TABLE users (
	username varchar(255),
	password varchar(255),
	email varchar(255),
	last_login date,
	primary key username
);