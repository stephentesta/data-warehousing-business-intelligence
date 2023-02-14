-- 1. List the event number, date held, customer number, customer name, facility number, and facility name of 2022 events placed by Boulder customers.
select EventNo, DateHeld, Customer.CustNo, CustName, Facility.FacNo, FacName
	from EventRequest inner join Customer 
		on EventRequest.CustNo = Customer.CustNo
		inner join Facility	on EventRequest.FacNo = Facility.FacNo
	where date_part('YEAR', DateHeld) = 2022
		and City = 'Boulder';
	
-- 2. List the customer number, customer name, event number, date held, facility number, facility name, and estimated audience cost per person (EstCost / EstAudience) for events held on 2022, 
-- in which the estimated cost per person is less than $0.2
select Customer.CustNo, CustName, EventNo, DateHeld,
	EstAudience, Facility.FacNo, FacName, 
	EstCost/EstAudience as CostPerPerson
	from Customer inner join EventRequest
		on Customer.CustNo = EventRequest.CustNo
		inner join Facility 
			on EventRequest.FacNo = Facility.FacNo
	where EstCost/EstAudience < 0.2
		and date_part('YEAR', DateHeld) = 2022;

-- 3. List the customer number, customer name, and total estimated costs for Approved events. The total amount of events is the sum of the estimated cost for each event. 
-- Group the results by customer number and customer name.

select Customer.CustNo, CustName, sum(EstCost) as TotEstCost
	from EventRequest inner join Customer
		on EventRequest.CustNo = Customer.CustNo
	where Status = 'Approved'
	group by Customer.CustNo, CustName;

-- 4. For event plans with a work date in 2022, summarize the event plans managed by each employee and work date month. 
-- The result should include the employee number, employee name, month, count of event plans, and sum of the estimated cost of the associated event requests. 
-- For Oracle, you can use the EXTRACT function to extract the month of a date column. For PostgreSQL, you can use the DATE_PART function to extract the month of a date column.

select Employee.EmpNo, EmpName, date_part('MONTH', WorkDate) as WorkDateMonth, 
		count(*) as CntEventPlans, sum(EstCost) as SumEstCost
	from Employee inner join EventPlan
		on Employee.EmpNo = EventPlan.EmpNo
	inner join EventRequest
		on EventPlan.EventNo = EventRequest.EventNo
	where date_part('YEAR', WorkDate) = 2022
	group by Employee.EmpNo, EmpName, date_part('MONTH', WorkDate);

-- 5. Insert yourself as a new row in the Customer table.

insert into Customer
(CustNo, CustName, Address, City, State, Zip, Phone, Contact, Internal)
values ('C106', 'High School Basketball', '456 PrimeTime', 'Boulder', 
'CO', 80314, 1234567, 'Coach Steve', 'N');

-- 6. Increase the rate by 10 percent of the resource with name nurse in the ResourceTbl table.

update ResourceTbl
	set Rate = Rate * 1.10
where ResName = 'nurse';

-- check if updated correctly, goes from 20 -> 22
select * from resourcetbl
	where ResName = 'nurse';

-- 7. Delete the new row added to the Customer table.
delete from Customer
	where CustNo = 'C106';