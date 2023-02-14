-- 1.	List the customer number, the name, the phone number, and the city of customers.
select CustNo, CustName, Phone, City, State
	from Customer;
	
-- 2.	List the customer number, the name, the phone number, and the city of customers who reside in Colorado (State is CO).
select CustNo, CustName, Phone, City, State
	from Customer
	where State = 'CO';
	
-- 3.	List all columns of the EventRequest table for events costing more than $4000.  Order the result by the event date (DateHeld).
select * from  EventRequest
where EstCost > 4000
order by DateHeld;

-- 4.	List the event number, the event date (DateHeld), and the estimated audience number with approved status and 
-- audience greater than 9000 or with pending status and audience greater than 7000.
select EventNo, DateHeld, EstAudience
	from EventRequest
	where (Status = 'Approved' and EstAudience > 9000)
		or (Status = 'Pending' and EstAudience > 7000);

-- 5.	List the event number, event date (DateHeld), customer number and customer name of events placed in December 2022 by customers from Boulder.
select EventNo, DateHeld, Customer.CustNo, CustName
	from EventRequest, Customer
	where EventRequest.CustNo = Customer.CustNo
		and City = 'Boulder'
		and date_part('YEAR', DateHeld) = 2022
		and date_part('MONTH', DateHeld) = 12;

-- alternatively
select EventNo, DateHeld, Customer.CustNo, CustName
	from EventRequest inner join Customer
		on EventRequest.CustNo = Customer.CustNo
	where City = 'Boulder'
		and date_part('YEAR', DateHeld) = 2022
		and date_part('MONTH', DateHeld) = 12;

-- 6.	List the average number of resources used (NumberFld) by plan number. Include only location number L100.
select planno, avg(ResourceCnt) as AvgNumResources
	from EventPlanLine
	where EventPlanLine.LocNo = 'L100'
	group by EventPlanLine.planno;
	
-- 7.	List the average number of resources used (NumberFld) by plan number. Only include location number L100. 
-- Eliminate plans with less than two event lines containing location number L100.

select planno, avg(ResourceCnt)
	from EventPlanLine
	where LocNo = 'L100'
	group by planno
	having count(planno) >= 2;