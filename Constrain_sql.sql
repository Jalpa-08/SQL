show databases;
create database bit_aa;
use bit_aa;

create table student_info( 
Student_name VARCHAR (30), 
Last_name VARCHAR(30), 
Student_Id INT(10), 
Student_city VARCHAR(30));

show tables;
insert into bit_aa.student_info values ("jalpa", "patel", 40, "anand");
insert into bit_aa.student_info values ("visahl", "barod", 41, "baroda");
insert into bit_aa.student_info values ("mehul", "Sirohi", 44, "baroda");

select * from bit_aa.student_info;
insert into student_info values
("alpa", "patel1", 20, "anand"),
("parag", "buch", 20, "anand"),
("pooja", "patel3", 10, "anand"),
("parth", "patel", 20, "anand"),
("xyz", "patel", 30, "anand"),
("dev", "darji", 400, "anand")

insert into student_info values
("alpa", "patel1", 20, "anand"),
("alpa", "patel1", 20, "anand"),
("alpa", "patel1", 20, "anand")

create table if not exists test12( 
test_id int auto_increment,
test_name varchar(30), 
test_mailid varchar(30),
test_adress varchar(30)
)

create table if not exists test( 
test_id int auto_increment,
test_name varchar(30) , 
test_mailid varchar(30),
test_adress varchar(30),
primary key (test_id)
)
insert into test values (102,'jalpa','jalpa@gmail','abad'),
(2,'jalpa','jalpa@gmail','abad'),
(3,'jalpa','jalpa@gmail','abad'),
(4,'jalpa','jalpa@gmail','abad')

insert into test(test_name , test_mailid , test_adress) 
values ('jal','jalpa@gmail.com','baroda'),
('jal','jalpa@gmail.com','baroda'),
('jal','jalpa@gmail.com','baroda'),
('jal','jalpa@gmail.com','baroda')

select * from test

create table if not exists test ( 
test_id int auto_increment,
test_name varchar(30) , 
test_mailid varchar(30),
teast_adress varchar(30),
primary key (test_id))

create table if not exists test5 ( 
test_id int ,
test_name varchar(30) , 
test_mailid varchar(30),
test_adress varchar(30),
test_salary int check(test_salary < 10000))

insert into test4 values
(1,'jalpa','jalpa@gmail.com','anand',100000)


create table if not exists test3 ( 
test_id int ,
test_name varchar(30) , 
test_mailid varchar(30),
test_adress varchar(30) check (test_adress= 'bengalore'),
test_salary int)

insert into test3 ( test_id , test_name , test_mailid , teast_adress,test_salary) 
values (100 , 'jal','jalpa@gmail.com','baroda' , 5000)

create table if not exists test8( 
test_id int NOT NULL auto_increment  ,
test_name varchar(30)  NOT NULL default 'unknown' , 
test_mailid varchar(30) unique NOT NULL,
test_adress varchar(30) check (test_adress= 'bengalore') NOT NULL,
test_salary int check(test_salary > 10000) NOT NULL,
primary key (test_id))

select * from test8

insert into test8 ( test_id , test_name , test_mailid , 
test_adress,test_salary) 
values (100 , 'jal','jalpa@gmail.com','bengalore' , 500000)