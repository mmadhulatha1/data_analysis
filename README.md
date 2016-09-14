
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
* Query table, join tables.
* Create Views, materialized views

