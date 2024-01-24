
create table salesman
(
salesman_id varchar(5),
name varchar(15),
city varchar(15),
commission int,
primary key(salesman_id)
);

create table customer
(
customer_id varchar(5),
cust_name varchar(15),
city varchar(15),
grade int,
salesman_id varchar(5),
primary key(customer_id),
foreign key(salesman_id) references salesman(salesman_id) on delete cascade
);

create table orders
(
ord_no varchar(5),
purchase_amt int,
ord_date date,
customer_id varchar(5),
salesman_id varchar(5),
primary key(ord_no),
foreign key(customer_id) references customer(customer_id) on delete cascade,
foreign key(salesman_id) references salesman(salesman_id) on delete cascade
);


insert into salesman values
(1, "Guru","Mangalore",5),
(2, "Ravi","Bengaluru",3),
(3, "Girish","Hubli",3),
(4, "Sagar","Bengaluru",3),
(5, "Raj","Mangalore",4);

insert into customer values
("C11","Srikanth","Bengaluru",4,2),
("C12","Sandeep","Mangalore",2,3),
("C13","Uday","Bengaluru",3,2),
("C14","Mahesh","Hubli",2,2),
("C15","Shivaram","Bengaluru",2,3),
("C16","Shyam","Mangalore",5,1),
("C17","Sumit","Udupi",4,5),
("C18","Shravan","Bengaluru",3,4);


insert into orders values
("0111",2500,"2017-07-11","C11",2),
("0112",1999,"2017-07-09","C12",3),
("0113",999,"2017-07-12","C13",2),
("0114",9999,"2017-07-12","C14",2),
("0115",7999,"2017-07-11","C15",3),
("0116",1099,"2017-07-09","C16",1);
