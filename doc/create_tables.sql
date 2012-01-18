
create table wae06_user (
guid integer auto_increment primary key,
name varchar(25) not null,
register_date date not null,
admin boolean not null,
password varchar(25) not null
);

create table wae06_category (
guid integer auto_increment primary key,
name varchar(50) not null
);

create table wae06_entry (
guid integer auto_increment primary key,
published date not null,
content text,
titel varchar(50) not null,
user_guid integer,
category_guid integer, 
foreign key (user_guid) references wae06_user(guid),
foreign key (category_guid) references wae06_category(guid)
);

	
	INSERT INTO `wae06_user` (
	`guid` ,
	`name` ,
	`register_date` ,
	`admin` ,
	`password`
	)
	VALUES (
	NULL ,  'admin',  '2012-01-11',  '1',  'admin'
	);
	
	INSERT INTO  `wae06_category` (
	`guid` ,
	`name`
	)
	VALUES (
	NULL ,  'Allgemein'
	);
	
	INSERT INTO  `wae06_entry` (
	`guid` ,
	`published` ,
	`content` ,
	`titel` ,
	`user_guid` ,
	`category_guid`
	)
	VALUES (
	NULL ,  '2012-01-11', 'Content' ,  'TestTitel',  '1',  '1'
	);