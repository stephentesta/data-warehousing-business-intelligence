-- drop tables if they exist
drop table if exists EventPlanLine;
drop table if exists EventPlan;
drop table if exists EventRequest;
drop table if exists Customer;
drop table if exists location;
drop table if exists Facility;
drop table if exists ResourceTbl;
drop table if exists Employee;

create table Customer
(
	CustNo varchar(8),
	CustName varchar(50) constraint CustNameRequired not null,
	Address varchar(50) constraint AddressRequired not null,
	City varchar(30) constraint CityRequired not null,
	State char(2) constraint StateRequired not null,
	Zip varchar(10) default '80202' constraint ZipRequired not null ,
	Phone varchar(11) constraint PhoneRequired not null,
	Contact varchar(35) constraint ContactRequired not null,
	Internal char(1) default 'Y' constraint InternalRequired not null,
	constraint PKCustNo primary key (CustNo)
);

create table Facility
(
	FacNo varchar(8),
	FacName varchar(30) constraint FacNameRequired not null,
	constraint PKFacNo primary key (FacNo),
	constraint UnqiueFacName unique (FacName)
);

create table location
(
	LocNo varchar(8),
	LocName varchar(30) constraint LocNameRequired not null,
	FacNo varchar(8) constraint FacNoRequired not null,
	constraint PKLocNo primary key (LocNo),
	constraint FKFacNo foreign key (FacNo) references Facility (FacNo)
);

create table ResourceTbl
(
	ResNo varchar(8),
	ResName varchar(30) constraint ResNameRequired not null,
	Rate decimal(12, 2) default 1 constraint RateRequired not null,
	constraint PKResNo primary key (ResNo),
	constraint ResNameUnique unique (ResName),
	constraint ValidRate check (Rate > 0)
);

create table Employee
(
	 EmpNo varchar(8),
	 EmpName varchar(50) constraint EmpNameRequired not null,
	 Department varchar(25) constraint DepartmentRequried not null,
	 Email varchar(30) constraint EmailRequired not null,
	 Phone varchar(11) constraint PhoneRequired not null,
	 MrgNo varchar(8),
	 constraint PKEmpNo primary key (EmpNo),
	 constraint EmailUnique unique (Email),
	 constraint FKMrgNo foreign key (MrgNo) references Employee (EmpNo)
	 
);

create table EventRequest
(
	EventNo varchar(8),
	DateHeld date constraint DateHeldRequired not null,
	DateReq date default current_date constraint DateReqRequired not null,
	DateAuth date,
	Status varchar(8) default 'PENDING' constraint StatusRequired not null,
	EstCost decimal(12,2) constraint EstCostReqired not null,
	EstAudience integer constraint EstAudienceRequired not null,
	BudNo varchar(8),
	CustNo varchar(8) constraint CustNoRequired not null,
	FacNo varchar(8) constraint FacNoRequired not null,
	constraint PKEventNo primary key (EventNo),
	constraint ValidStatus check (Status in ('Pending', 'Approved', 'Denied')),
	constraint ValidEstAudience check (EstAudience > 0),
	constraint FKCustNo foreign key (CustNo) references Customer (CustNo),
	constraint FKFacNo foreign key (FacNo) references Facility (FacNo)
);

create table EventPlan
(
	PlanNo varchar(8),
	Notes varchar(50),
	WorkDate date constraint WorkDateRequired not null,
	Activity varchar(50) constraint ActivityRequired not null,
	EventNo varchar(8) constraint EventNoRequried not null,
	EmpNo varchar(8),
	constraint PKPlanNo primary key (PlanNo),
	constraint FKEventNo foreign key (EventNo) references EventRequest (EventNo) on delete cascade,
	constraint FKEmpNo foreign key (EmpNo) references Employee (EmpNo)
);

create table EventPlanLine
(
	PlanNo varchar(8),
	LineNo integer,
	TimeStart timestamp constraint TimeStartRequired not null,
	TimeEnd timestamp constraint TimeEndRequired not null,
	ResourceCnt integer constraint ResourceCntRequired not null,
	LocNo varchar(8) constraint LocNoRequired not null,
	ResNo varchar(8) constraint ResNoRequired not null,
	constraint PKEventPlanLine primary key (PlanNo, LineNo),
	constraint FKPlanNo foreign key (PlanNo) references EventPlan (PlanNo) on delete cascade,
	constraint VaidStartEndTime check (TimeStart < TimeEnd),
	constraint ValidResourceCnt check (ResourceCnt > 0), -- do I keep this constraint? (doesn't seem to be specified)
	constraint FKLocNo foreign key (LocNo) references location (LocNo),
	constraint FKResNo foreign key (ResNo) references ResourceTbl (ResNo)
);