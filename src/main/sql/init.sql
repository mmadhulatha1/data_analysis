create database data_analysis;
CREATE USER 'user1' IDENTIFIED BY 'password1';
GRANT ALL PRIVILEGES ON data_analysis.* TO user1;
grant file on *.* to user1;

