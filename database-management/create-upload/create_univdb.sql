-- Drop tables if exists 
drop table if exists Enrollment;
drop table if exists Offering;
drop table if exists Student;
drop table if exists Course;
drop table if exists Faculty;

-- Create Tables
create table Student
(
	StdNo char(11) constraint StdNoRequired not null,
	StdFirstName varchar(50) constraint StdFirstNameRequired not null,
	StdLastName varchar(50) constraint StdLastNameRequired not null,
	StdCity varchar(50) constraint StdCityRequired not null,
	StdState char(2) constraint StdStateRequired not null,
	StdZip char(10) constraint StdZipRequired not null,
	StdMajor char(6),
	StdClass char(6),
	StdGPA decimal(3,2) default 0,
	constraint PKStudent primary key (StdNo),
	constraint ValidGPA check ( StdGPA between 0 and 4 ),
	constraint ValidStdClass check (StdClass in ('FR', 'SO', 'JR', 'SR')),
	constraint MajorDeclared check 
				( StdClass in ('FR', 'SO') or StdMajor is not null )
);

create table Faculty 
(
	FacNo char(11),
	FacFirstName varchar(30) constraint FacFirstNameRequired not null,
	FacLastName varchar(30) constraint FacLastName not null,
	FacCity varchar(30) constraint FacCityRequired not null,
	FacState varchar(30) constraint FacStateRequired not null,
	FacZipCode char(10) constraint FacZipRequired not null,
	FacRank char(4),
	FacHireDate date,
	FacSalary decimal(10, 2),
	FacSupervisor char(11),
	FacDept char(6),
	constraint FacultyPK primary key (FacNo),
	constraint SupervisorFK foreign key (FacSupervisor) references Faculty
	
);

create table Course
(
	CourseNo char(6),
	CrsDesc varchar(50) constraint CrsDescRequired not null,
	CrsUnits integer,
	constraint CoursePk primary key (CourseNo),
	constraint UniqueCrsDesc unique (CrsDesc)
);

create table Offering 
(
	OfferNo integer,
	CourseNo char(6) constraint OffCourseNoRequired not null,
	OffTerm char(6) constraint OffTermRequired not null,
	OffYear integer default 2022 constraint OffYearRequired not null,
	OffLocation varchar(30),
	OffTime varchar(10),
	FacNo char(11),
	OffDays char(6) default 'MW',
	constraint OfferingPK primary key (OfferNo),
	constraint CourseFk foreign key (CourseNo) references Course,
	constraint FacultyFk foreign key (FacNo) references Faculty
	
);

create table Enrollment 
(
	OfferNo integer,
	StdNo char(11),
	EnrGrade decimal(3,2) default 0,
	constraint EnrollmentPK primary key (OfferNo, StdNo),
	constraint OfferingFK foreign key (OfferNo) references Offering on delete cascade,
	constraint StudentFk foreign key (StdNo) references Student on delete cascade
);
