create database dress_data12;
use dress_data12;
create table if not exists dress12(
`Dress_ID` varchar(30),	
`Style`	varchar(30),	
`Price`	varchar(30),	
`Rating`	varchar(30),	
`Size`	varchar(30),	
`Season`	varchar(30),	
`NeckLine`	varchar(30),	
`SleeveLength` varchar(30),		
`waiseline`	varchar(30),	
`Material`	varchar(30),	
`FabricType`	varchar(30),	
`Decoration`	varchar(30),	
`Pattern Type` varchar(30),		
`Recommendation` varchar(30))	

LOAD DATA INFILE  
'D:/AttributeDataSet.csv'
into table dress12
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS

show databases

## secure-file-priv

create table if not exists test ( 
test_id int auto_increment,
test_name varchar(30) , 
test_mailid varchar(30),
teast_adress varchar(30),
primary key (test_id))

create table if not exists test3 ( 
test_id int ,
test_name varchar(30) , 
test_mailid varchar(30),
test_adress varchar(30),
test_salary int check(test_salary > 10000))

create table if not exists test8( 
test_id int NOT NULL auto_increment  ,
test_name varchar(30)  NOT NULL default 'unknown' , 
test_mailid varchar(30) unique NOT NULL,
test_adress varchar(30) check (test_adress= 'bengalore') NOT NULL,
test_salary int check(test_salary > 10000) NOT NULL,
primary key (test_id))

select * from test8

insert into test8 ( test_id , test_name , test_mailid , teast_adress,test_salary) values (100 , 'jal','jalpa@gmail.com','baroda' , 5000)




