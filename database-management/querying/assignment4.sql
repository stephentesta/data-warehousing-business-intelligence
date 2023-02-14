-- 1. List the city, state, and zip codes in the customer table.  Your result should not have duplicates. (Hint: The DISTINCT keyword eliminates duplicates.)
select distinct City, State, Zip
	from Customer;

-- 2.	List the name, department, phone number, and email address of employees with a phone number beginning with “3-”.
select EmpName, Department, Phone, Email
	from Employee
	where Phone like '3-%';
	
-- 3.	List all columns of the resource table with a rate between $10 and $20. Sort the result by rate.
select *
	from ResourceTbl
	where Rate between 10 and 20
	order by Rate;
	
-- 4. List the event requests with a status of “Approved” or “Denied” and an authorized date in July 2022. Include the event number, authorization date, and status in the output.
select EventNo, DateAuth, Status
	from EventRequest
	where Status in ('Approved', 'Denied')
		and DateAuth between '07-01-2022' and '07-31-2022';
	
-- 5. List the location number and name of locations that are part of the “Basketball arena”.  Your WHERE clause should not have a condition involving the facility number compared to a constant (“F101”). Instead, you should use a condition on the FacName column for the value of “Basketball arena”.
select LocNo, LocName 
	from location inner join Facility
		on location.FacNo = Facility.FacNo
	where FacName = 'Basketball arena';
	
-- 6. For each event plan, list the plan number, count of the event plan lines, and sum of the number of resources assigned.  For example, plan number P100 has 4 lines and 7 resources assigned. You only need to consider event plans that have at least one line.
select EventPlanLine.PlanNo, count(EventPlanLine.LineNo), sum(EventPlanLine.ResourceCnt)
 	from EventPlanLine
 	group by EventPlanLine.PlanNo;
 	
 -- 7.	For each event plan with a time start in October 2022, list the plan number, count of the event plan lines, and sum of the number of resources assigned.  For example, plan number P100 has 4 lines and 7 resources assigned.  
 -- The result should only contain event plans that have sum of resources of 10 or more. For conditions on columns containing both date and time details, you should include both the date and time for conditions testing end of day. 
 -- In PostgreSQL, the condition to test the end of December 2022 should use a TIMESTAMP constant of '31-Dec-2022 11:59PM'. In Oracle with the DATE data type for a column, you should use the TO_DATE function such as TO_DATE('31-Dec-2022 23:59', 'DD-Mon-YYYY HH24:MI').
 select EventPlanLine.PlanNo, count(EventPlanLine.LineNo) as NumberOfLines, sum(EventPlanLine.ResourceCnt) as "Resource Sum"
 	from EventPlanLine
 	where EventPlanLine.TimeStart between '2022-10-1' and '2022-10-31 11:59PM'
 	group by EventPlanLine.PlanNo
 	having sum(EventPlanLine.ResourceCnt) >= 10;
 