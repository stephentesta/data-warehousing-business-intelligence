-- drop tables 
drop table if exists OrderTbl;
drop table if exists Customer;
drop table if exists Employee;


create table Customer
(
	CustNo char(8),
	CustFirstName varchar(50) constraint CustFirstNameRequired not null,
	CustLastName varchar(50) constraint CustLastNameRequired not null, 
	CustCity varchar(30),
	CustState char(2),
	CustZip varchar(10),
	CustBal decimal(12,2),
	constraint PKCustNo primary key (CustNo)
);

create table Employee
(
	EmpNo char(8),
	EmpFirstName varchar(50) constraint EmpFirstNameRequired not null,
	EmpLastName varchar(50) constraint EmpLastNameReqired not null,
	EmpPhone varchar(15),
	EmpEmail varchar(50) constraint EmpEmailRequired not null,
	constraint PKEmpNo primary key (EmpNo),
	constraint EmpEmailUnique unique (EmpEmail)
);

create table OrderTbl 
(
	OrdNo varchar(8),
	OrdDate date constraint OrdDateRequired not null,
	CustNo char(8) constraint CustNoRequired not null,
	EmpNo char(8),
	constraint PKOrdNo primary key (OrdNo),
	constraint FKCustNo foreign key (CustNo) references Customer (CustNo),
	constraint FKEmpNo foreign key (EmpNo) references Employee (EmpNo)
);