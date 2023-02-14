-- 1. List the order number, order date, customer number, customer name (first and last), employee number, and employee name (first and last) of January 2021 orders placed by Colorado customers.

select OrdNo, OrdDate, Customer.CustNo, CustFirstName, CustLastName, Employee.EmpNo, EmpFirstName, EmpLastName
	from OrderTbl inner join Customer
		on OrderTbl.CustNo = Customer.CustNo
	inner join Employee 
		on Employee.EmpNo = OrderTbl.EmpNo
	where OrdDate between '1-Jan-2021' and '31-Jan-2021'
		and CustState = 'CO';
		
-- 2 List the customer number, name (first and last), order number, order date, employee number, employee name (first and last), 
-- product number, product name, and order cost (OrdLine.Qty * ProdPrice) for products ordered on January 23, 2021, in which the order cost exceeds $150.

select CustFirstName, CustLastName, OrderTbl.OrdNo, OrdDate, Employee.EmpNo, EmpFirstName, EmpLastName, 
	Product.ProdNo, ProdName, Qty * ProdPrice as OrderCost
	from Customer inner join OrderTbl
		on Customer.CustNo = OrderTbl.CustNo
	inner join Employee
		on OrderTbl.EmpNo = Employee.EmpNo
	inner join OrdLine
		on OrdLine.OrdNo = OrderTbl.OrdNo
	inner join Product
		on Product.ProdNo = OrdLine.ProdNo
	where OrdDate = '23-Jan-2021'
		and Qty * ProdPrice > 150;

-- 3. List the order number and total amount for orders placed on January 23, 2021. The total amount of an order is the sum of the quantity times the product price of each product on the order.

select OrderTbl.OrdNo, sum(Qty*ProdPrice) as TotalAmount
	from OrdLine inner join Product
		on OrdLine.ProdNo = Product.ProdNo
	inner join OrderTbl
		on OrderTbl.OrdNo = OrdLine.OrdNo
	where OrdDate = '23-Jan-2021'
	group by OrderTbl.OrdNo;
	
-- 4. List the order number, order date, customer name (first and last), and total amount for orders placed on January 23, 2021. The total amount of an order is the sum of the quantity times the product price of each product on the order.

select OrderTbl.OrdNo, OrdDate, CustFirstName, CustLastName, sum(Qty*ProdPrice) as TotalAmount
	from OrderTbl inner join Customer
		on OrderTbl.CustNo = Customer.CustNo
	inner join OrdLine
		on OrderTbl.OrdNo = Ordline.OrdNo
	inner join Product
		on Product.ProdNo = OrdLine.ProdNo
	where OrdDate = '23-Jan-2021'
	group by OrderTbl.OrdNo, OrdDate, CustFirstName, CustLastName;

-- 5. List the order number, order date, customer name (first and last), employee name (first and last), count of items in products in an order, and total amount for orders placed on January 23, 2021. The total amount of an order is the sum of the quantity times the product price of each product on the order. 
-- The result should only contain orders with more than two different products ordered.

select OrderTbl.OrdNo, OrdDate, CustFirstName, CustLastName, EmpFirstName, EmpLastName,
		count(*) as TotalProds, sum(Qty*ProdPrice) as TotalAmount
	from OrderTbl inner join Customer
		on OrderTbl.CustNo = Customer.CustNo
	inner join OrdLine
		on OrdLine.OrdNo = OrderTbl.OrdNo
	inner join Product
		on Product.ProdNo = OrdLine.ProdNo
	inner join Employee
		on Employee.EmpNo = OrderTbl.EmpNo
	where OrdDate = '23-Jan-2021'
	group by OrderTbl.OrdNo, OrdDate, CustFirstName, CustLastName,
		EmpFirstName, EmpLastName
	having count(*) > 2;
