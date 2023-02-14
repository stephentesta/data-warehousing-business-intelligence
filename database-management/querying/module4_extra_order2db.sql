-- 1.	List the customer number, the name (first and last), and the balance of customers.
select CustFirstName, CustLastName, CustBal
	from Customer;
	
-- 2.	List the customer number, the name (first and last), and the balance of customers who reside in Colorado (CustState is CO).
select CustFirstName, CustLastName, CustBal
	from Customer
	where CustState = 'CO';

-- 3.	List all columns of the Product table for products costing more than $50.  Order the result by product manufacturer (ProdMfg) and product name.
select *
	from Product
	where ProdPrice > 50
	order by ProdMfg, ProdName;
	
-- 4.	List the customer number, the name (first and last), the city, and the balance of customers who reside in Denver with a balance greater than $150 or who reside in Seattle with a balance greater than $300.
select CustNo, CustFirstName, CustLastName, CustCity, 
		CustBal 
	from Customer
	where (CustCity = 'Denver' and CustBal > 150)
		or (CustCity = 'Seattle' and CustBal > 300);
		
-- 5.	List the order number, order date, customer number, and customer name (first and last) of orders placed in January 2021 sent to Colorado recipients.
select OrdNo, OrdDate, OrderTbl.CustNo, CustFirstName, CustLastName
	from OrderTbl inner join Customer 
		on OrderTbl.CustNo = Customer.CustNo
	where date_part('MONTH', OrdDate) = 1
		and date_part('YEAR', OrdDate) = 2021
		and OrdState = 'CO';

-- alternatively
select OrdNo, OrdDate, OrderTbl.CustNo, CustFirstName, CustLastName
	from OrderTbl inner join Customer
		on OrderTbl.CustNo = Customer.custno 
	where OrdDate between '1-Jan-2021' and '31-Jan-2021'
		and OrdState = 'CO';

-- 6.	List the average balance of customers by city. Include only customers residing in Washington state (WA). 
select avg(CustBal) as AvgCustBal, CustCity
	from Customer
	where CustState = 'WA'
	group by CustCity;
	
-- 7.	List the average balance and number of customers by city. Only include customers residing in Washington State (WA).  Eliminate cities in the result with less than two customers.
select avg(CustBal) as AvgCustBal, count(*) as CustCount, CustCity
	from Customer
	where CustState = 'WA'
	group by CustCity
	having count(CustNo) > 1;