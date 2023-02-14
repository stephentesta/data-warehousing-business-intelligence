-- 4.30 List the student name, offering number, and grade of students who have a grade ≥ 3.5 in a course offering
select StdFirstName, StdLastName, OfferNo, EnrGrade
	from Enrollment, Student
	where Enrollment.StdNo = Student.StdNo
		and EnrGrade >= 3.5;
	
-- 4.31 List the names of students who have a grade ≥ 3.5 in a course offering
select StdFirstName, StdLastName
	from Enrollment, Student
	where Enrollment.StdNo = Student.StdNo
		and EnrGrade >= 3.5;
		
-- 4.32 List the student names (without duplicates) that have a grade ≥ 3.5 in a course offering
select distinct StdFirstName, StdLastName
	from Enrollment, Student
	where Enrollment.StdNo = Student.StdNo
		and EnrGrade >= 3.5;

-- 4.33 List the student name and the offering number in which the grade is greater than 3.7 and the offering is given in fall 2019.
select StdFirstName, StdLastName, Enrollment.OfferNo
	from Offering, Enrollment, Student
	where Offering.OfferNo = Enrollment.OfferNo
		and Enrollment.StdNo = Student.StdNo
		and EnrGrade >= 3.7
		and OffYear = 2019
		and OffTerm = 'FALL';

-- 4.34 List Leonard Vince’s teaching schedule in fall 2019. For each course, list the offering number, course number, number of units,
-- days, location, and time.
select OfferNo, Course.CourseNo, CrsUnits, OffDays, OffLocation, Offtime
	from Course, Offering, Faculty
	where Course.CourseNo = Offering.CourseNo
		and Offering.FacNo = Faculty.FacNo
		and OffYear = 2019
		and OffTerm = 'FALL';

-- 4.35 List Bob Norbert’s course schedule in spring 2020. For each course, list the offering number, course number, days, location, time,
-- and faculty name.
select Offering.OfferNo, Offering.CourseNo, OffDays, OffLocation, OffTime, FacFirstName, FacLastName
	from Student, Enrollment, Offering, Faculty
	where Student.StdNo = Enrollment.StdNo
		and Enrollment.OfferNo = Offering.OfferNo
		and Offering.FacNo = Faculty.FacNo
		and StdFirstName = 'BOB'
		and StdLastName = 'NORBERT'
		and OffYear = 2020
		and OffTerm = 'SPRING';

-- 4.36 List Bob Norbert’s course schedule in spring 2017. For each course, list the offering number, course number, days, location, time,
-- course units, and faculty name.
select Offering.OfferNo, Offering.CourseNo, OffDays, OffLocation, OffTime, CrsUnits, FacFirstName, FacLastName
	from Student, Enrollment, Offering, Course, Faculty
	where Student.StdNo = Enrollment.StdNo
		and Enrollment.OfferNo = Offering.OfferNo
		and Offering.CourseNo = Course.CourseNo
		and Offering.FacNo = Faculty.FacNo
		and StdFirstName = 'BOB'
		and StdLastName = 'NORBERT'
		and OffYear = 2020
		and OffTerm = 'SPRING';

-- 4.37 List students who are on the faculty. Include all student columns in the result
select Student.*
	from Student, Faculty
	where StdNo = FacNO;
	
-- 4.38 Retrieve the name, city, and grade of students who have a high grade (greater than or equal to 3.5) in a course offering.
select StdFirstName, StdLastName, StdCity, EnrGrade
	from Enrollment inner join Student
		on Enrollment.StdNo = Student.StdNo
	and EnrGrade >= 3.5;
	
-- 4.39 Retrieve the name, city, and grade of students who have a high grade (greater than or equal 3.5) in a course offered in fall
-- 2019.
select StdFirstName, StdLastName, EnrGrade 
	from (Enrollment inner join Student
		on Enrollment.StdNo = Student.StdNo)
	inner join Offering
		on Enrollment.OfferNo = Offering.OfferNO
	where EnrGrade >= 3.5
		and OffTerm = 'FALL'
		and OffYear = 2019;

-- 4.40 Retrieve the name, city, and grade of students who have a high grade (greater than or equal to 3.5) in a course offered in fall
-- 2019 taught by Leonard Vince.
-- some dbms require parentheses 
select StdFirstName, StdLastName, StdCity, EnrGrade
	from ((Student inner join Enrollment
			on Student.StdNo = Enrollment.StdNo)
		inner join Offering 
			on Enrollment.OfferNo = Offering.OfferNo)
		inner join Faculty
			on Offering.FacNo = Faculty.FacNo
	where EnrGrade >= 3.5
		and OffTerm = 'FALL'
		and OffYear = 2019
		and FacFirstName = 'LEONARD'
		and FacLastName = 'VINCE';

-- 4.41 mixing styles, I don't like and won't do it.
-- Retrieve the name, city, and grade of students who have a high grade (greater than or equal to 3.5) in a course offered in fall
-- 2016 taught by Leonard Vince (same result as above). 
select StdFirstName, StdLastName, StdCity, EnrGrade
	from ((Student inner join Enrollment
			on Student.StdNo = Enrollment.StdNo)
		inner join Offering
			on Offering.OfferNo = Enrollment.OfferNo),
		Faculty
	where Faculty.FacNo = Offering.FacNo
		and EnrGrade >= 3.5
		and OffTerm = 'FALL'
		and OffYear = 2019
		and FacFirstName = 'LEONARD'
		and FacLastName = 'VINCE';

-- 4.42 List faculty members who have a higher salary than their supervisor. List the faculty number, name, and salary of the faculty and
-- supervisor
select Subordinate.FacNo, Subordinate.FacFirstName, Subordinate.FacLastName, Subordinate.FacSalary,
		Superior.FacNo, Superior.FacFirstName, Superior.FacLastName, Superior.FacSalary
	from Faculty Superior, Faculty Subordinate
	where Superior.FacNo = Subordinate.FacSupervisor
		and Subordinate.FacSalary > Superior.FacSalary;
		
-- 4.43 List the names of faculty members and the course number for which the faculty member teaches the same course number as his
-- or her supervisor in 2020
-- review this again
select FacFirstName, FacLastName, Offer1.CourseNo
	from Faculty, Offering Offer1, Offering Offer2
	where Faculty.FacNo = Offer1.FacNo
		and Faculty.FacSupervisor = Offer2.FacNo
		and Offer1.OffYear = 2020 and Offer2.OffYear = 2020
		and Offer1.CourseNo = Offer2.CourseNo;
		
-- 4.44 List the course number, the offering number, and the number of students enrolled. Only include courses offered in spring 2020.
select CourseNo, Enrollment.OfferNo, count(*) as NumStudents
	from Enrollment, Offering
	where Enrollment.OfferNo = Offering.OfferNo
		and OffYear = 2020
		and OffTerm = 'SPRING'
	group by Enrollment.OfferNo, CourseNo;
	
-- 4.45 List the course number, offer number, and average student GPA for course offerings taught in fall 2019 in which the average
-- GPA is greater than 3.0.
select CourseNo, Offering.OfferNo, avg(StdGPA) as AvgGPA
	from Enrollment, Offering, Student
	where Enrollment.OfferNo = Offering.OfferNo
		and Enrollment.StdNo = Student.StdNo
		and Offering.OffYear = 2019
		and Offering.OffTerm = 'FALL'
	group by Offering.OfferNo, CourseNo
	having avg(StdGPA) > 3.0;
	
-- 4.46 List the hiring year, offering year, and number of course offerings taught by faculty hired after 2003. The year function extracts
-- the year component of a date column.
select date_part('YEAR', FacHireDate) as FacHireYear, OffYear, count(*) as NumCourses 
	from Offering, Faculty
	where Offering.FacNo = Faculty.FacNo
		and date_part('YEAR', FacHireDate) > 2006
	group by date_part('YEAR', FacHireDate), OffYear;
	
-- 4.47 Show all faculty and students. Only show the common columns in the result.
select FacNo as PerNo, FacFirstName as FirstName, FacLastName as LastName,
	FacCity as City, FacState as State
	from Faculty
		union
select StdNo as PerNO, StdFirstName as FirstName, StdLastName as LastName, 
	StdCity as City, StdState as State
	from Student;
	
-- 4.48 Show teaching assistants, graduate students who also teach courses so they appear in both Student and Faculty tables. Only
-- show the common columns in the result.
select FacNo as PerNo, FacFirstName as FirstName, FacLastName as LastName,
	FacCity as City, FacState as State
	from Faculty
		intersect
select StdNo as PerNo, StdFirstName as FirstName, StdLastName as LastName,
	StdCity as City, StdState as State
	from Student;

-- 4.49 Show faculty who are not students (faculty who are not graduate students). Only show the common columns in the result. Oracle
-- uses the MINUS keyword instead of the EXCEPT keyword used in SQL:2016.
select FacNo as PerNo, FacFirstName as FirstName, FacLastName as LastName,
	FacCity as City, FacState as State
	from Faculty
		except
select StdNo as PerNo, StdFirstName as FirstName, StdLastName as LastName,
	StdCity as City, StdState as State
	from Student;

-- 4.50 Insert a row into the Student table supplying values for all columns.
insert into Student
	(StdNo, StdFirstName, StdLastName, StdCity,
		StdState, StdZip, StdClass, StdMajor, StdGPA)
	values
		('999999999', 'JOE', 'STUDENT', 'SEATAC',
			'WA', '98042-1121', 'FR', 'IS', 0.0);

-- 4.51 Assume a new table ISStudent has been previously created. ISStudent has the same columns as Student. This INSERT statement
-- copies rows from Student into ISStudent.
--insert into ISStudent
--	select * from Student where StdMajor = 'IS';
		
-- 4.52 Give faculty members in the MS department a 10 percent raise. Four rows are updated.
update Faculty
	set FacSalary = FacSalary * 1.1
	where FacDept = 'MS';

-- 4.53 Change the major and class of Homer Wells. One row is updated
update Student
	set StdMajor = 'ACCT', StdClass = 'SO'
	where StdFirstName = 'HOMER'
		and StdLastName = 'WELLS';

-- 4.54 Delete all IS majors who are seniors. Three rows are deleted.
-- delete from Student
--	where StdMajor = 'IS' and StdClass = 'SR';
	
-- 4.55 Delete all rows in the ISStudent table. This example assumes that the ISStudent table has been previously created.
-- delete from ISStudent;

-- 4.56 Update the location of offerings taught by Leonard Vince in 2016 to BLM412. Two Offering rows are updated.
-- Access only
--update Offering inner join Faculty
/*	on Offering.FacNo = Faculty.FacNo
 set OffLocation = 'BLM412'
 where OffYear = 2016 and FacFirstName = 'LEONARD'
 	and FacLastName = 'VINCE';*/

-- 4.57 Delete offerings taught by Leonard Vince. Three Offering rows are deleted. In addition, this statement deletes related rows in
-- the Enrollment table because the ON DELETE clause is set to CASCADE.
-- Access only
/*delete Offering.*
	from Offering inner join Faculty
		on Offering.FacNo = Faculty.FacNo 
	where FacFirstName = 'LEONARD'
		and FacLastName = 'VINCE';*/

-- 4.58 List the offer number, course number, and faculty number for course offerings scheduled in fall 2019. The Oracle SQL
-- compiler indicates “FROM keyword not found where expected”. The Access SQL compiler indicates “Syntax error (missing
-- operator) …”.
-- postgres - SQL Error [42601]: ERROR: syntax error at or near "Offering"
/*SELECT OfferNo, CourseNo, FacNo
	FROMM Offering
	WHERRE OffTerm = 'FALL' AND OffYear = 2019*/

-- 4.59 List the student name and offering number in which the grade is greater than 3.7 and the offering is given in fall 2019. The
-- Oracle SQL compiler indicates “column ambiguously defined”. The Access SQL compiler indicates “The specified field ‘OfferNo’
-- could refer to more than one table …”.
-- postgres - SQL Error [42702]: ERROR: column reference "offerno" is ambiguous 
/*select StdFirstName, StdLastName, OfferNo
	from Student, Enrollment, Offering
	where Student.StdNo = Enrollment.StdNo
		and Offering.OfferNo = Enrollment.OfferNO
		and OffYear = 2019 and OffTerm = 'FALL'
		and EnrGrade >= 3.7; */

-- 4.60 List the student name and the offering number in which the grade is greater than 3.7 and the offering occurred in fall 2019. The
-- Oracle SQL compiler indicates “EnrGrade; invalid identifier. The Access SQL compiler generates a window asking for a parameter
-- value.
-- postgres - SQL Error [42P01]: ERROR: missing FROM-clause entry for table "enrollment"
/*select StdFirstName, StdLastName, Enrollment.OfferNo
	from Student, Offering
	where Student.StdNo = Enrollment.StdNo
		and Offering.OfferNo = Enrollment.OfferNo
		and OffYear = 2019 and OffTerm = 'FALL'
		and EnrGrade >= 3.7;*/

-- 4.61 List the course number, offer number, and average student GPA for course offerings taught in fall 2019 in which the average
-- GPA is greater than 3.0. The Oracle SQL compiler generates a syntax error indicating, “not a GROUP BY expression”. The Access
-- SQL compiler generates a syntax error indicating, “Your query does not include the specified expression as part of an aggregate
-- function”
-- postgres - ERROR: column "offering.offyear" must appear in the GROUP BY clause or be used in an aggregate function
-- this is a row conidition appearing in the having clause
select CourseNo, Enrollment.OfferNo,
	avg(StdGPA) as AvgGPA
	from Student, Offering, Enrollment
	where Offering.OfferNo = Enrollment.OfferNo
		and Enrollment.StdNo = Student.StdNo
		and OffTerm = 'FALL'
	group by CourseNo, Enrollment.OfferNo
	having avg(StdGPA) > 3.0 and OffYear = 2019;
	
-- 4.62 List the course number, offer number, and average student GPA for course offerings taught in fall 2019 in which the average GPA is
-- greater than 3.0. The Oracle SQL compiler generates a syntax error indicating, “not a GROUP BY expression”. The Access SQL compiler generates a syntax error indicating, “Your query does not include the specified expression as part of an aggregate function”.
-- postgres - SQL Error [42803]: ERROR: column "enrollment.offerno" must appear in the GROUP BY clause or be used in an aggregate function
-- missing column in group by clause
/*select CourseNo, Enrollment.OfferNo,
	avg(StdGPA) as AvgGPA
	from Student, Offering, Enrollment
	where Offering.OfferNo = Enrollment.OfferNo
		and Enrollment.StdNo = Student.StdNo
		and OffTerm = 'FALL' and OffYear = 2019
	group by CourseNo
	having avg(StdGPA) > 3.0;*/

-- 4.63 List the student name and the offering number in which the grade is greater than 3.7 and the offering is given in fall 2019. The
-- statement executes with the correct rows in the result.
-- runs - extra table Course
select StdFirstName, StdLastName, Enrollment.OfferNO
	from Student, Enrollment, Offering, Course
	where Student.StdNo = Enrollment.StdNo 
		and Offering.OfferNo = Enrollment.OfferNo
		and Course.CourseNo = Offering.CourseNo
		and OffYear = 2019 and OffTerm = 'FALL'
		and EnrGrade >= 3.7;

-- 4.64 List the student name and the offering number in which the grade is greater than 3.7 and the offering is given in fall 2019. The
-- GROUP BY clause causes extra resource consumption.
select StdFirstName, StdLastName, Enrollment.OfferNo
	from Student, Enrollment, Offering
	where Student.StdNo = Enrollment.StdNo
		and Offering.OfferNo = Enrollment.OfferNo
		and OffYear = 2019 and OffTerm = 'FALL'
		and EnrGrade >= 3.7
	group by StdFirstName, StdLastName, Enrollment.OfferNo;
	
-- 4.65 List the offer number, course number, and faculty number for course offerings scheduled in spring or summer of 2019. Note that
-- the AND operator takes precedence over the OR operator.
-- missing parenthesis
select OfferNo, CourseNo, FacNo, OffYear, OffTerm
	from Offering
	where OffTerm = 'SPRING' or OffTerm = 'SUMMER'
		and OffYear = 2019;
	
-- 4.66 List the student name and the offering number in which the grade is greater than 3.7 and the offering is given in fall 2019.
-- The result contains extra Enrollment rows that do not match Offering rows because of the missing join condition. You should
-- remember that joining three tables typically requires two join conditions.
-- missing join conditions
select StdFirstName, StdLastName, Enrollment.OfferNo
	from Student, Enrollment, Offering
	where Student.StdNo = Enrollment.StdNo
		and OffYear = 2019 and OffTerm = 'FALL'
		and EnrGrade >= 3.7;

-- 4.67 List the student name and the offering number in which the grade is greater than 3.7 and the offering is given in fall 2019. The
-- result only contains the correct set of rows because 2020 offerings do not occur in the fall term. If additional rows in fall term
-- of another year are added, the result rows will not be correct.
-- missing 2019 where condition
select StdFirstName, StdLastName, Enrollment.OfferNo
	from Student, Enrollment, Offering
	where Student.StdNo = Enrollment.StdNo
		and Offering.OfferNo = Enrollment.OfferNo
		and OffTerm = 'FALL'
		and EnrGrade >= 3.7;
	
-- 4.68 List Bob Norbert’s course schedule in spring 2017. For each course, list the offering number, course number, days, location, time,
-- course units, and faculty name. The statement contains poor clause alignment, an incompatible constant, and a LIKE operator
-- without a pattern matching character. Example 4.36 shows the original statement with good coding practices.

/*SELECT Offering.OfferNo, Offering.CourseNo, OffDays,
 OffLocation, OffTime, CrsUnits, FacFirstName,
 FacLastName FROM Faculty, Offering, Enrollment, Student, Course WHERE Faculty.FacNo =
Offering.FacNo AND
Offering.OfferNo
 = Enrollment.OfferNo
 AND Student.StdNo = Enrollment.StdNo
AND Offering.CourseNo = Course.CourseNo
 AND OffYear = '2017' AND OffTerm = 'SPRING'
 AND StdFirstName LIKE 'BOB' AND StdLastName = 'NORBERT'*/

