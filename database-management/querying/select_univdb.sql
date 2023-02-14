-- select all columns from faculty
select * from faculty;

-- select where (exact matching)
select *
	from faculty
	where FacNo = '543-21-0987';
	
-- retrieve subset of rows and columns 
select FacFirstName, FacLastName, FacSalary
	from Faculty
	where FacSalary > 65000 and FacRank = 'PROF';

-- distinct example
select FacCity, FacState
	from Faculty;

select distinct FacCity, FacState
	from Faculty;
	
-- expressions instead of just column names, date conditions in the where clause
select FacFirstName, FacLastName, FacCity,
		FacSalary*1.1 as IncreasedSalary,
		FacHireDate
	from Faculty
	where (date_part('YEAR', FacHireDate)) > 2008;

-- inexact matching
select *
	from Offering
	where CourseNo like 'IS%';

select course.courseno, course.crsdesc, course.crsunits  
	from course
	where crsdesc like '%DATA%';

-- between-and operator on dates
select faculty.facfirstname, faculty.faclastname, faculty.fachiredate
	from faculty
	where faculty.fachiredate between '2008-1-1' and '2009-1-1';
	
-- select the month number
select facfirstname, faclastname, fachiredate
	from faculty
	where date_part('MONTH', fachiredate) = 4;

-- testing for null values
select OfferNo, CourseNo
	from offering
	where FacNo is null
		and OffTerm = 'SUMMER'
		and OffYear = 2020;
		
-- mixing and and or
select offerno, courseno, facno
	from offering
	where (offterm = 'FALL' and offyear = 2019)
		or (offterm = 'WINTER' and offyear = 2020);
		
select Enrollment.OfferNO, Offering.CourseNo, avg(Student.StdGpa) as AvgGPA
	from Enrollment inner join Offering
		on Enrollment.OfferNo = Offering.OfferNo
	inner join Student
		on Enrollment.StdNo = Student.StdNo
	group by Enrollment.OfferNo, Offering.CourseNo
	having avg(Student.StdGpa) > 3.0;