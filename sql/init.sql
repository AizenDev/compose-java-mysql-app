CREATE DATABASE IF NOT EXISTS dd;
USE dd;

CREATE TABLE UserProfile (
    userId varchar(50) PRIMARY KEY,
    name varchar(50),
    email varchar(50)
);
