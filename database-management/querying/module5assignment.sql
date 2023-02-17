-- UnivDB

-- 1.	For event requests, list the event number, event date (eventrequest.dateheld), and count of the event plans.  
-- Only include event requests in the result if the event request has more than one related event plan with a work date in December 2022.

select EventRequest.EventNo, DateHeld, count(*) as NumEventPlans
	from EventRequest inner join EventPlan
		on EventRequest.EventNo = EventPlan.EventNo
	where WorkDate between '12-1-2022' and '12-31-2022'
	group by EventRequest.EventNo, DateHeld;
	

-- 2. List the plan number, event number, work date, and activity of event plans meeting the following two conditions: (1) the work date is in December 2022 and (2) the event is held in the “Basketball arena”.  Your query must not use the facility number (“F101”) of the basketball arena in the WHERE clause. 
-- Instead, you should use a condition on the FacName column for the value of “Basketball arena”.

select EventPlan.PlanNo, EventRequest.EventNo, WorkDate, Activity
	from EventPlan inner join EventRequest
		on EventPlan.EventNo = EventRequest.EventNo
	inner join Facility
		on EventRequest.FacNo = Facility.FacNo
	where WorkDate between '12-1-2022' and '12-31-2022'
		and FacName = 'Basketball arena';
		
-- 3. List the event number, event date, status, and estimated cost of events where there is an event plan managed by Mary Manager and the event is held in the basketball arena in the period October 1 to December 31, 2022.  
-- Your query must not use the facility number (“F101”) of the basketball arena or the employee number (“E101”) of “Mary Manager” in the WHERE clause. 
-- Thus, the WHERE clause should not have conditions involving the facility number or employee number compared to constant values.

select EventRequest.EventNo, DateHeld, Status, EstCost
	from EventRequest inner join EventPlan
		on EventRequest.EventNo = EventPlan.EventNo
	inner join Employee
		on EventPlan.EmpNo = Employee.EmpNo
	inner join Facility
		on Facility.FacNo = EventRequest.FacNo
	where EmpName = 'Mary Manager'
		and FacName = 'Basketball arena'
		and WorkDate between '10-1-2022' and '12-31-2022';
		
-- 4. List the plan number, line number, resource name, count of resources (EventPlanLine.ResourceCnt), location name, time start, and time end where the event is held at the basketball arena, the event plan has activity of activity of “Operation”, and the event plan has a work date in the period October 1 to December 31, 2022.  
-- Your query must not use the facility number (“F101”) of the basketball arena in the WHERE clause. Instead, you should use a condition on the FacName column for the value of “Basketball arena”.
	
select EventPlan.PlanNo, LineNo, ResName, ResourceCnt, LocName, TimeStart, TimeEnd
	from EventPlanLine inner join ResourceTbl 
		on EventPlanLine.ResNo = ResourceTbl.ResNo
	inner join location
		on EventPlanLine.LocNo = location.LocNo
	inner join Facility
		on location.FacNo = Facility.FacNo
	inner join EventPlan
		on EventPlanLine.PlanNo = EventPlan.PlanNo
	where FacName = 'Basketball arena'
		and Activity = 'Operation'
		and WorkDate between '10-1-2022' and '12-31-2022';
		
-- 5. List the event plan number and sum of the resource cost for event plans. Only summarize event plans with a work date in December 2022. 
-- The resource cost is computed as the resource count (ResourceCnt) times the rate of the resource. 
-- The result should only include event plans with the sum of the resource cost greater than 50.
	
select EventPlan.PlanNo, sum(ResourceCnt*Rate) as ResourceCost
	from EventPlanLine inner join EventPlan
		on EventPlanLine.PlanNo = EventPlan.PlanNo
	inner join ResourceTbl	
		on ResourceTbl.ResNo = EventPlanLine.ResNo
	where WorkDate between '12-1-2022' and '12-31-2022'
	group by EventPlan.PlanNo
	having sum(ResourceCnt*Rate) > 50;

-- Database Modification Problems

-- 1. Insert a new row into the Facility table with facility name “Swimming Pool”.

insert into Facility
	(FacNo, FacName)
	values ('F104', 'Swimming Pool');

-- 2. Insert a new row in the Location table related to the Facility row in modification problem 1. The new row should have “Door” for the location name.

insert into location
	(LocNo, LocName, FacNo)
	values ('L107', 'Door', 'F104');
	
-- 3. Insert a new row in the Location table related to the Facility row in modification problem 1. The new row should have “Locker Room” for the location name.

insert into location
	(LocNo, LocName, FacNo)
	values ('L108', 'Locker Room', 'F104');

-- 4. Change the location name of “Door” to “Gate” for the row inserted in modification problem 2.

update location 
	set LocName = 'Gate'
	where LocName = 'Door';

-- 5. Delete the rows inserted in modification problems 2 and 3

delete from location
	where LocName = 'Locker Room';

delete from location
	where LocNo = 'L107'; 
	

-- 1.	Identify errors in the following SQL statement and label errors with error type (syntax, redundancy, or semantic). To simplify your work, the statement has only one type of error. Rewrite the statement to remove the error.

/*SELECT eventrequest.eventno, dateheld, status, estcost
	FROM eventrequest, employee, facility, eventplan
	WHERE estaudience > 5000
  		AND eventplan.empno = employee.empno 
  		AND eventrequest.facno = facility.facno
  		AND facname = 'Football stadium' 
  		AND empname = 'Mary Manager';*/

 -- Semantic error missing join condition between EventRequest and EventPlan on EventNo
select EventRequest.EventNo, dateheld, status, estcost
	from EventRequest, Employee, Facility, EventPlan
	where EstAudience > 5000
		and EventRequest.EventNo = EventPlan.EventNo
		and EventPlan.EmpNo = Employee.EmpNo
		and EventRequest.FacNo = Facility.FacNo
		and FacName = 'Football stadium'
		and EmpName = 'Mary Manager';

-- 2. Identify errors in the following SQL statement and label errors with error type (syntax, redundancy, or semantic). To simplify your work, the statement has only one type of error. Rewrite the statement to remove the error.

/*
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
	FROM eventrequest, eventplan
	WHERE estaudience > 4000
		AND eventplan.eventno = eventrequest.eventno 
	GROUP BY eventrequest.eventno, dateheld, status, estcost;
*/

-- Redundancy Error, do not need group by clause when using the distinct keyword
select distinct EventRequest.EventNo, DateHeld, Status, EstCost
	from EventRequest, EventPlan
	where EstAudience > 4000
		and EventPlan.EventNo = EventRequest.EventNo;

-- 3. Identify errors in the following SQL statement and label errors with error type (syntax, redundancy, or semantic). To simplify your work, the statement has only one type of error. Rewrite the statement to remove the error.

/*
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
	FROM eventrequest, employee, facility, eventplan
	WHERE estaudience > 5000
		AND eventplan.empno = employee.empno 
  		AND eventrequest.facno = facility.facno
  		AND eventplan.eventno = eventrequest.eventno 
  		AND facname = 'Football stadium';
*/

-- Redudancy Error: Extra tables, don't need Employee Table
select distinct EventRequest.EventNo, DateHeld, Status, EstCost
	from EventRequest, Facility, EventPlan
	where EstAudience > 5000
		and EventRequest.FacNo = Facility.FacNo
		and EventRequest.EventNo = EventPlan.EventNo
		and FacName = 'Football stadium';

-- 4. Identify errors in the following SQL statement and label errors with error type (syntax, redundancy, or semantic). To simplify your work, the statement has only one type of error. Rewrite the statement to remove the errors.

/*SELECT DISTINCT eventno, dateheld, status, estcost
	FROM eventrequest, employee, eventplan
	WHERE estaudience BETWEN 5000 AND 10000
  		AND eventplan.empno = employee.empno 
  		AND eventrequest.eventno = eventplan.eventno
  		AND empname = 'Mary Manager';*/

-- Syntax Error: between keyword spelled wrong, unqualified name EventNo
select distinct EventRequest.EventNo, DateHeld, Status, EstCost
	from EventRequest, Employee, EventPlan
	where EstAudience between 5000 and 10000
		and EventPlan.EmpNo = Employee.EmpNo
		and EventRequest.EventNo = EventPlan.EventNo
		and EmpName = 'Mary Manager';
		
-- 5. Identify areas in which the SQL statement has poor coding practices and rewrite the statement to improve the coding practices. You do not need to search for syntax errors.
/*SELECT eventplan.planno, lineno, resname, 
resourcecnt, timestart, timeend
    FROM eventrequest, facility, eventplan, 
eventplanline, resourcetbl
     WHERE estaudience = '10000'
AND eventplan.planno = 
eventplanline.planno AND eventrequest.facno 
= facility.facno
      AND facname = 
'Basketball arena' AND 
   eventplanline.resno = resourcetbl.resno
      AND eventrequest.eventno = eventplan.eventno;*/

-- Poor clause and condition allignment, incompatiable constant in where clause (estaudience = '10000')
select EventPlan.PlanNo, LineNo, ResName, ResourceCnt,
	TimeStart, TimeEnd
	from EventRequest, Facility, EventPlan,
		EventPlanLine, ResourceTbl
	where EstAudience = 10000
		and EventPlan.PlanNo = EventPlanLine.PlanNo
		and EventRequest.FacNo = Facility.FacNo
		and EventPlanLine.ResNo = ResourceTbl.ResNo
		and EventRequest.EventNo = EventPlan.EventNo
		and FacName = 'Basketball arena';