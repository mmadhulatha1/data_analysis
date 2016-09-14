
drop table if exists customers_dim;

drop table if exists email_addresses_dim;

create table customers_dim (id int, firstName varchar(100), lastName varchar(100), gender char(1));

create table email_addresses_dim (id int, email varchar(100));


LOAD DATA INFILE 'customers_dim.tsv'
INTO TABLE customers_dim
FIELDS TERMINATED BY '\t'
ENCLOSED BY ''
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'email_addresses_dim.tsv'
INTO TABLE email_addresses_dim
FIELDS TERMINATED BY '\t'
ENCLOSED BY ''
LINES TERMINATED BY '\n';
