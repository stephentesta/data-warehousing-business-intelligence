-- cross product join style
-- list tables in the from clause
-- list join conditions in the where clause 
-- must include join condition, omission would result in a cross product operation
-- containing all pairs of rows from each table, not just the matching rows
select OfferNo, CourseNo, FacFirstName, FacLastName
	from Offering, Faculty
	where OffTerm = 'FALL' and OffYear = 2019
	and FacRank = 'ASST' and CourseNo like 'IS%'
	and Faculty.FacNo = Offering.FacNo; -- join condition

-- join tables but only show data from one table
-- crsdesc is from coure and is used in the where clause to filter rows
select offerno, offering.courseno, offdays, offtime
	from offering, course
	where offterm = 'SPRING' and offyear = 2020
	and (crsdesc like '%DATABASE%')
	and course.courseno = offering.courseno;

-- join operator style
-- use inner join and on keywords
-- from clause contains join operations
select OfferNo, CourseNo, FacFirstName, FacLastName
	from Offering inner join Faculty
		on Faculty.FacNo = Offering.FacNo
	where OffTerm = 'FALL' and OffYear = 2019
		and FacRank = 'ASST' and CourseNo like 'IS%'; 
	
-- cross product style with 3 tables
-- rule of thumb: number of join conditions = number of tables - 1
select OfferNo, Offering.CourseNo, CrsUnits, OffDays, OffLocation, OffTime
	from Faculty, Offering, Course -- 3 tables 
	where Faculty.FacNo = Offering.FacNo -- join conditions
		and Offering.CourseNo = Course.CourseNo -- join conditions
		and OffYear = 2019
		and OffTerm = 'FALL'
		and FacFirstName = 'LEONARD'
		and FacLastName = 'VINCE';
	
-- join operator style with 3 tables
-- order of join operations not important as 
-- the SQL complier will determine the mose efficient order
select OfferNo, Offering.CourseNo, OffDays,
		CrsUnits, OffLocation, OffTime
	from Offering inner join Course
		on Offering.CourseNo = Course.CourseNo
		inner join Faculty on Offering.FacNo = Faculty.FacNo
	where OffYear = 2019 and OffTerm = 'FALL'
		and FacFirstName = 'LEONARD'
		and FacLastName = 'VINCE';

-- Sort faculty by rank
select FacNo, FacRank, FacSalary
	from Faculty
	order by FacRank;
	
-- compute average salary for each faculty rank
select FacRank,
		avg(FacSalary) as AvgSalary
	from Faculty
	group by FacRank
order by FacRank;

-- summarize number of offerings and unique courses by year
select offyear, count(*) as numofferings,
		count(distinct courseno) as numcourses
	from offering
	group by offyear;

-- row conditions vs group conditions
-- row conditions specified with where clause
-- group conditions are specified with having clause

-- row conditions
-- compute average GPA by major for upper class students
select StdMajor, avg(StdGPA) as AvgGpa
from student 
where StdClass in ('JR', 'SR')
group by StdMajor;

-- group conditions
select StdMajor, avg(StdGPA) as AvgGpa
from Student
where StdClass in ('JR', 'SR')
group by StdMajor
having avg(StdGPA) > 3.1;

-- syntax errors with where/having
-- misplaced row condition 
--select StdMajor, avg(StdGPA) as AvgGpa
--	from Student
--	group by StdMajor
--	having avg(StdGPA) > 3.1
--		and StdClass in ('JR', 'SR')

--misplaced row summary condition
select StdMajor, avg(StdGPA) as AvgGpa
	from Student
	where StdClass in ('JR', 'SR')
		and avg(StdGPA) > 3.1
	group by StdMajor;
	
-- place row conditions without aggregate functions in the where clause
-- and row conditions with aggregate functions in the having clause

-- grouping all rows
select count(*) as StdCnt, avg(StdGPA) as AvgGPA
	from student
	where StdClass in ('JR', 'SR');
	
-- grouping on two columns
select StdMajor, StdClass, min(StdGPA) as MinGPA,
	max(StdGPA) as MaxGPA
	from Student
	group by StdMajor, StdClass
	order by StdMajor;
	
-- grouping and joins
select CrsDesc, count(*) as OfferCount
	from Course, Offering
	where Course.CourseNo = Offering.CourseNo
		and Course.CourseNo like 'IS%'
	group by CrsDesc;
	
-- making results look nice with group by
select StdGPA, StdFirstName, StdLastName, StdCity,
		StdState
	from Student
	where StdClass = 'JR'
	order by StdGPA;
	
-- sorting on two columns with descending order
select FacRank, FacSalary, FacFirstName, FacLastName,
		FacDept
	from Faculty
	order by FacRank, FacSalary desc;

-- result with duplicates
select FacCity, FacState
	from Faculty;
	
-- use distinct to eliminate duplicates
select distinct FacCity, FacState
	from Faculty;