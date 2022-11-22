/* A relational database is designed to enforce the uniqueness of primary keys by allowing only one row with a given primary key value in a table.
 A foreign key is a column or a set of columns in a table whose values correspond to the values of the primary key in another table. */
 
use customer
select * from customer_X

CREATE TABLE if not exists customer_X(
Id int NOT NULL,
Name varchar(20) NOT NULL,
Age int NOT NULL,
Address varchar(25) ,
Salary decimal (18, 2),
PRIMARY KEY (id)
);

CREATE TABLE if not exists Orders(
OrderID int NOT NULL, 
OrderNumber int NOT NULL, 
Id int, 
PRIMARY KEY(OrderID), 
CONSTRAINT FK_customerOrder FOREIGN KEY(Id)
REFERENCES CUSTOMER_X (id)
);
desc orders

ALTER TABLE Orders
ADD FOREIGN KEY (ID) REFERENCES customer(id);

ALTER TABLE Orders
DROP FOREIGN KEY FK_customerOrder;

