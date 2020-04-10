Use Login;

create table if not exists APP_USER
(
	USER_ID  bigint not null primary key,
	USER_NAME varchar(36) not null unique,
    ENCRYPTED_PASSWORD VARCHAR(128) not null,
    ENABLED BIT not null
);


create table if not exists APP_ROLE
(
	ROLE_ID bigint not null primary key,
    ROLE_NAME varchar(36) not null unique
);

create table if not exists USER_ROLE 
(
	ID bigint not null primary key,
    USER_ID bigint not null unique,
    ROLE_ID bigint not null unique,
	constraint USER_ROLE_ibfk_1
		foreign key (USER_ID) references APP_USER(USER_ID),
	constraint USER_ROLE_ibfk_2
		foreign key (ROLE_ID) references APP_ROLE(ROLE_ID)
);

create table if not exists Persistent_Logins (
    username varchar(64) not null,
    series varchar(64) not null primary key,
    token varchar(64) not null,
    last_used timestamp not null
);