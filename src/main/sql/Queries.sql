select * from customers_dim c join email_addresses_dim e on c.id = e.id limit 5;
select c.id, firstName, lastName, gender, email from customers_dim c join email_addresses_dim e on c.id = e.id limit 5;
create view user_details as select c.id, firstName, lastName, gender, email from customers_dim c join email_addresses_dim e on c.id = e.id;
select * from user_details limit 10;
create table user_details_tbl as select c.id, firstName, lastName, gender, email from customers_dim c join email_addresses_dim e on c.id = e.id;

