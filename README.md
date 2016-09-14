
# Datasets #


* Copied from https://github.com/pivotalsoftware/pivotal-samples/tree/master/sample-data

# Query Patterns #

* Create Database, user, grant previliges

		mysql -u root -p < src/main/sql/init.sql
		Enter password:	

		mysql -u user1 -p data_analysis
		Enter password:
		Welcome to the MySQL monitor.  Commands end with ; or \g.
		Your MySQL connection id is 75
		Server version: 5.5.49-0ubuntu0.14.04.1 (Ubuntu)

		Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.

		Oracle is a registered trademark of Oracle Corporation and/or its
		affiliates. Other names may be trademarks of their respective
		owners.

		Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

		mysql> show tables;
		Empty set (0.00 sec)

		mysql> \q
		Bye
	
		
* Create tables, load data

		mv ~/*.tsv  /var/lib/mysql/data_analysis

		mysql -u user1 -p data_analysis < src/main/sql/setup.sql				

		mysql> show tables;
		+-------------------------+
		| Tables_in_data_analysis |
		+-------------------------+
		| customers_dim           |
		| email_addresses_dim     |
		+-------------------------+
		2 rows in set (0.00 sec)

		mysql> select count(*) from customers_dim;
		+----------+
		| count(*) |
		+----------+
		|   401430 |
		+----------+
		1 row in set (0.22 sec)

		mysql> select count(*) from email_addresses_dim;
		+----------+
		| count(*) |
		+----------+
		|   401430 |
		+----------+
		1 row in set (0.17 sec)
		

* Query table, join tables.

		mysql> select * from customers_dim c join email_addresses_dim e on c.id = e.id limit 5;
		+----------+-----------+-----------+--------+----------+---------------------------------+
		| id       | firstName | lastName  | gender | id       | email                           |
		+----------+-----------+-----------+--------+----------+---------------------------------+
		|  3331977 | Lea       | Fishman   | F      |  3331977 | Lea.Fishman@llnw.com            |
		| 11941331 | Annie     | Slaughter | M      | 11941331 | Annie.Slaughter@bitsnoop.com    |
		|  6323509 | Ezell     | Huang     | M      |  6323509 | Ezell.Huang@edeng.cn            |
		| 15092605 | Daren     | Yearwood  | M      | 15092605 | Daren.Yearwood@xiaoshuo5200.com |
		| 16610154 | Lovie     | Vestal    | F      | 16610154 | Lovie.Vestal@meneame.net        |
		+----------+-----------+-----------+--------+----------+---------------------------------+
		5 rows in set (12.06 sec)

		mysql> select c.id, firstName, lastName, gender, email from customers_dim c join email_addresses_dim e on c.id = e.id limit 5;
		+----------+-----------+-----------+--------+---------------------------------+
		| id       | firstName | lastName  | gender | email                           |
		+----------+-----------+-----------+--------+---------------------------------+
		|  3331977 | Lea       | Fishman   | F      | Lea.Fishman@llnw.com            |
		| 11941331 | Annie     | Slaughter | M      | Annie.Slaughter@bitsnoop.com    |
		|  6323509 | Ezell     | Huang     | M      | Ezell.Huang@edeng.cn            |
		| 15092605 | Daren     | Yearwood  | M      | Daren.Yearwood@xiaoshuo5200.com |
		| 16610154 | Lovie     | Vestal    | F      | Lovie.Vestal@meneame.net        |
		+----------+-----------+-----------+--------+---------------------------------+
		5 rows in set (11.93 sec)

* Create Views.

		mysql> create view user_details as select c.id, firstName, lastName, gender, email from customers_dim c join email_addresses_dim e on c.id = e.id;

		mysql> select * from user_details limit 5;
		+----------+-----------+-----------+--------+---------------------------------+
		| id       | firstName | lastName  | gender | email                           |
		+----------+-----------+-----------+--------+---------------------------------+
		|  3331977 | Lea       | Fishman   | F      | Lea.Fishman@llnw.com            |
		| 11941331 | Annie     | Slaughter | M      | Annie.Slaughter@bitsnoop.com    |
		|  6323509 | Ezell     | Huang     | M      | Ezell.Huang@edeng.cn            |
		| 15092605 | Daren     | Yearwood  | M      | Daren.Yearwood@xiaoshuo5200.com |
		| 16610154 | Lovie     | Vestal    | F      | Lovie.Vestal@meneame.net        |
		+----------+-----------+-----------+--------+---------------------------------+
		5 rows in set (11.86 sec)

* CTAS(emulate materialized view).
		mysql> create table user_details_tbl as select c.id, firstName, lastName, gender, email from customers_dim c join email_addresses_dim e on c.id = e.id;

		mysql> select * from user_details_tbl limit 10;
		+----------+-----------+------------+--------+-----------------------------------+
		| id       | firstName | lastName   | gender | email                             |
		+----------+-----------+------------+--------+-----------------------------------+
		|  3331977 | Lea       | Fishman    | F      | Lea.Fishman@llnw.com              |
		| 11941331 | Annie     | Slaughter  | M      | Annie.Slaughter@bitsnoop.com      |
		|  6323509 | Ezell     | Huang      | M      | Ezell.Huang@edeng.cn              |
		| 15092605 | Daren     | Yearwood   | M      | Daren.Yearwood@xiaoshuo5200.com   |
		| 16610154 | Lovie     | Vestal     | F      | Lovie.Vestal@meneame.net          |
		| 11376480 | Jerimiah  | Bacon      | M      | Jerimiah.Bacon@wan5d.com          |
		|  8015596 | Vivian    | Morse      | F      | Vivian.Morse@webex.com            |
		|  6103761 | Patrica   | Grable     | F      | Patrica.Grable@prnewswire.com     |
		| 18442529 | Cal       | Sabin      | M      | Cal.Sabin@mapion.co.jp            |
		| 11551292 | Taryn     | Chronister | F      | Taryn.Chronister@digitalspy.co.uk |
		+----------+-----------+------------+--------+-----------------------------------+
		10 rows in set (0.00 sec)


