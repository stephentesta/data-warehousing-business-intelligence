-- INSERT Statements for PostgreSQL
-- Tables must be created before executing these statements.

Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values ('E100','Chuck Coordinator','Administration','chuck@colorado.edu','3-1111');
Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values ('E101','Mary Manager','Football','mary@colorado.edu','5-1111');
Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values ('E102','Sally Supervisor','Planning','sally@colorado.edu','3-2222');
Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values ('E103','Alan Administrator','Administration','alan@colorado.edu','3-3333');

Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C100','Football','Box 352200','Y','Mary Manager','6857100','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C101','Men''s Basketball','Box 352400','Y','Sally Supervisor','5431700','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C103','Baseball','Box 352020','Y','Bill Baseball','5431234','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C104','Women''s Softball','Box 351200','Y','Sue Softball','5434321','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C105','High School Football','123 AnyStreet','N','Coach Bob','4441234','Louisville','CO','80027');

Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R100','attendant',10);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R101','police',15);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R102','usher',10);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R103','nurse',20);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R104','janitor',15);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R105','food service',10);

Insert into FACILITY (FACNO,FACNAME) values ('F100','Football stadium');
Insert into FACILITY (FACNO,FACNAME) values ('F101','Basketball arena');
Insert into FACILITY (FACNO,FACNAME) values ('F102','Baseball field');
Insert into FACILITY (FACNO,FACNAME) values ('F103','Recreation room');

Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L100','F100','Locker room');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L101','F100','Plaza');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L102','F100','Vehicle gate');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L103','F101','Locker room');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L104','F100','Ticket Booth');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L105','F101','Gate');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L106','F100','Pedestrian gate');

Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E100','2022-10-25','2022-06-06','C100','F100','2022-06-08','Approved',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E101','2022-10-26','2022-07-28','C100','F100',NULL,'Pending',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E103','2022-09-21','2022-07-28','C100','F100','2022-08-01','Approved',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E102','2022-09-14','2022-07-28','C100','F100','2022-07-31','Approved',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E104','2022-12-03','2022-07-28','C101','F101','2022-07-31','Approved',2000,12000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E105','2022-12-05','2022-07-28','C101','F101','2022-08-01','Approved',2000,10000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E106','2022-12-12','2022-07-28','C101','F101','2022-07-31','Approved',2000,10000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E107','2022-11-23','2022-07-28','C105','F100','2022-07-31','Denied',10000,5000,null);

Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P100','E100','2022-10-25','Standard operation','Operation','E102');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P101','E104','2022-12-03','Watch for gate crashers','Operation','E100');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P102','E105','2022-12-05','Standard operation','Operation','E102');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P103','E106','2022-12-12','Watch for seat switching','Operation',null);
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P104','E101','2022-10-26','Standard cleanup','Cleanup','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P105','E100','2022-10-25','Light cleanup','Cleanup','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P199','E102','2022-12-10','ABC','Operation','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P299','E101','2022-10-26',NULL,'Operation','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P349','E106','2022-12-12',NULL,'Setup','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P85','E100','2022-10-25','Standard operation','Cleanup','E102');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P95','E101','2022-10-26','Extra security','Cleanup','E102');

-- TimeStart and TimeEnd both use TIMESTAMP data type so values include both date and time components
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P100',1,'2022-10-25 08:00:00','2022-10-25 017:00:00',2,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P100',2,'2022-10-25 12:00:00','2022-10-25 17:00:00', 2,'L101','R101');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P100',3,'2022-10-25 07:00:00','2022-10-25 16:30:00', 1,'L102','R102');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P100',4,'2022-10-25 18:00:00','2022-10-25 22:00:00', 2,'L100','R102');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P101',1,'2022-12-03 18:00:00','2022-12-03 20:00:00', 2,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P101',2,'2022-12-03 18:30:00','2022-12-03 19:00:00', 4,'L105','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P101',3,'2022-12-03 19:00:00','2022-12-03 20:00:00', 2,'L103','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P102',1,'2022-12-05 18:00:00','2022-12-05 19:00:00', 2,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P102',2,'2022-12-05 18:00:00','2022-12-05 21:00:00', 4,'L105','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P102',3,'2022-12-05 19:00:00','2022-12-05 22:00:00', 2,'L103','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P103',1,'2022-12-12 18:00:00','2022-12-12 21:00:00', 2,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P103',2,'2022-12-12 18:00:00','2022-12-12 21:00:00', 4,'L105','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P103',3,'2022-12-12 19:00:00','2022-12-12 22:00:00', 2,'L103','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P104',1,'2022-10-26 18:00:00','2022-10-26 22:00:00', 4,'L101','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P104',2,'2022-10-26 18:00:00','2022-10-26 22:00:00', 4,'L100','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P105',1,'2022-10-25 18:00:00','2022-10-25 22:00:00', 4,'L101','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P105',2,'2022-10-25 18:00:00','2022-10-25 22:00:00', 4,'L100','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P199',1,'2022-12-10 08:00:00','2022-12-10 12:00:00', 1,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P349',1,'2022-12-10 12:00:00','2022-12-12 15:30:00', 1,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P85',1,'2022-10-25 09:00:00','2022-10-25 17:00:00',  5,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P85',2,'2022-10-25 08:00:00','2022-10-25 17:00:00',  2,'L102','R101');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P85',3,'2022-10-25 10:00:00','2022-10-25 15:00:00',  3,'L104','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P95',1,'2022-10-26 08:00:00','2022-10-26 17:00:00',  4,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P95',2,'2022-10-26 09:00:00','2022-10-26 17:00:00',  4,'L102','R101');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P95',3,'2022-10-26 10:00:00','2022-10-26 15:00:00',  4,'L106','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P95',4,'2022-10-26 13:00:00','2022-10-26 17:00:00', 2,'L100','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,RESOURCECNT,LOCNO,RESNO) values ('P95',5,'2022-10-26 13:00:00','2022-10-26 17:00:00', 2,'L101','R104');

-- Use COMMIT statement if Auto Commit not set
COMMIT;