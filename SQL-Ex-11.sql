
/*
CREATE USER AMU IDENTIFIED BY AMU;
GRANT CONNECT, RESOURCE TO AMU;

-- GRANT SPACE QUOTA FOR USER
ALTER USER AMU QUOTA UNLIMITED ON users;

-- VERIFY QUOTA

SELECT username, tablespace_name, bytes, max_bytes
FROM dba_ts_quotas
WHERE username = 'AMU';
--------------------------------------------------------
*/

-- Oracle SQL Query Basic [15 Exercises with Solution]
-- -----------------------------------------------

SELECT * FROM TAB;

CREATE TABLE employees (
  EMPLOYEE_ID numeric(6) NOT NULL primary key,
  FIRST_NAME varchar2(20) DEFAULT NULL,
  LAST_NAME varchar2(25) NOT NULL,
  EMAIL varchar2(25) NOT NULL,
  PHONE_NUMBER varchar2(20) DEFAULT NULL,
  HIRE_DATE date NOT NULL,
  JOB_ID varchar2(10) NOT NULL,
  SALARY decimal(8,2) DEFAULT NULL,
  COMMISSION_PCT decimal(2,2) DEFAULT NULL,
  MANAGER_ID numeric(6) DEFAULT NULL,
  DEPARTMENT_ID numeric(4) DEFAULT NULL
);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (100,'Steven','King','SKING','515.123.4567','17-JUN-2003','AD_PRES',24000.00,0.00,0,90);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (101,'Neena','Kochhar','NKOCHHAR','515.123.4568','21-SEP-2005','AD_VP',17000.00,0.00,100,90);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (102,'Lex','De Haan','LDEHAAN','515.123.4569','13-JAN-2001','AD_VP',17000.00,0.00,100,90);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (103,'Alexander','Hunold','AHUNOLD','590.423.4567','03-JAN-2006','IT_PROG',9000.00,0.00,102,60);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (104,'Bruce','Ernst','BERNST','590.423.4568','21-MAY-2007','IT_PROG',6000.00,0.00,103,60);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (105,'David','Austin','DAUSTIN','590.423.4569','25-JUN-2005','IT_PROG',4800.00,0.00,103,60);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (106,'Valli','Pataballa','VPATABAL','590.423.4560','05-FEB-2006','IT_PROG',4800.00,0.00,103,60);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (107,'Diana','Lorentz','DLORENTZ','590.423.5567','07-FEB-2007','IT_PROG',4200.00,0.00,103,60);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (108,'Nancy','Greenberg','NGREENBE','515.124.4569','17-AUG-2002','FI_MGR',12000.00,0.00,101,100);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (109,'Daniel','Faviet','DFAVIET','515.124.4169','16-AUG-2002','FI_ACCOUNT',9000.00,0.00,108,100);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (110,'John','Chen','JCHEN','515.124.4269','28-SEP-2005','FI_ACCOUNT',8200.00,0.00,108,100);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (111,'Ismael','Sciarra','ISCIARRA','515.124.4369','30-SEP-2005','FI_ACCOUNT',7700.00,0.00,108,100);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (112,'Jose Manuel','Urman','JMURMAN','515.124.4469','07-MAR-2006','FI_ACCOUNT',7800.00,0.00,108,100);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (113,'Luis','Popp','LPOPP','515.124.4567','07-DEC-2007','FI_ACCOUNT',6900.00,0.00,108,100);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (114,'Den','Raphaely','DRAPHEAL','515.127.4561','07-DEC-2002','PU_MAN',11000.00,0.00,100,30);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (115,'Alexander','Khoo','AKHOO','515.127.4562','18-MAY-2003','PU_CLERK',3100.00,0.00,114,30);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (116,'Shelli','Baida','SBAIDA','515.127.4563','24-DEC-2005','PU_CLERK',2900.00,0.00,114,30);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (117,'Sigal','Tobias','STOBIAS','515.127.4564','24-JUL-2005','PU_CLERK',2800.00,0.00,114,30);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (118,'Guy','Himuro','GHIMURO','515.127.4565','15-NOV-2006','PU_CLERK',2600.00,0.00,114,30);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (119,'Karen','Colmenares','KCOLMENA','515.127.4566','10-AUG-2007','PU_CLERK',2500.00,0.00,114,30);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (120,'Matthew','Weiss','MWEISS','650.123.1234','18-JUL-2004','ST_MAN',8000.00,0.00,100,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (121,'Adam','Fripp','AFRIPP','650.123.2234','10-APR-2005','ST_MAN',8200.00,0.00,100,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (122,'Payam','Kaufling','PKAUFLIN','650.123.3234','01-MAY-2003','ST_MAN',7900.00,0.00,100,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (123,'Shanta','Vollman','SVOLLMAN','650.123.4234','10-OCT-2005','ST_MAN',6500.00,0.00,100,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (124,'Kevin','Mourgos','KMOURGOS','650.123.5234','16-NOV-2007','ST_MAN',5800.00,0.00,100,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (125,'Julia','Nayer','JNAYER','650.124.1214','16-JUL-2005','ST_CLERK',3200.00,0.00,120,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (126,'Irene','Mikkilineni','IMIKKILI','650.124.1224','28-SEP-2006','ST_CLERK',2700.00,0.00,120,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (127,'James','Landry','JLANDRY','650.124.1334','14-JAN-2007','ST_CLERK',2400.00,0.00,120,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (128,'Steven','Markle','SMARKLE','650.124.1434','08-MAR-2008','ST_CLERK',2200.00,0.00,120,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (129,'Laura','Bissot','LBISSOT','650.124.5234','20-AUG-2005','ST_CLERK',3300.00,0.00,121,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (130,'Mozhe','Atkinson','MATKINSO','650.124.6234','30-OCT-2005','ST_CLERK',2800.00,0.00,121,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (131,'James','Marlow','JAMRLOW','650.124.7234','16-FEB-2005','ST_CLERK',2500.00,0.00,121,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (132,'TJ','Olson','TJOLSON','650.124.8234','10-APR-2007','ST_CLERK',2100.00,0.00,121,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (133,'Jason','Mallin','JMALLIN','650.127.1934','14-JUN-2004','ST_CLERK',3300.00,0.00,122,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (134,'Michael','Rogers','MROGERS','650.127.1834','26-AUG-2006','ST_CLERK',2900.00,0.00,122,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (135,'Ki','Gee','KGEE','650.127.1734','12-DEC-2007','ST_CLERK',2400.00,0.00,122,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (136,'Hazel','Philtanker','HPHILTAN','650.127.1634','06-FEB-2008','ST_CLERK',2200.00,0.00,122,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (137,'Renske','Ladwig','RLADWIG','650.121.1234','14-JUL-2003','ST_CLERK',3600.00,0.00,123,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (138,'Stephen','Stiles','SSTILES','650.121.2034','26-OCT-2005','ST_CLERK',3200.00,0.00,123,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (139,'John','Seo','JSEO','650.121.2019','12-FEB-2006','ST_CLERK',2700.00,0.00,123,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (140,'Joshua','Patel','JPATEL','650.121.1834','06-APR-2006','ST_CLERK',2500.00,0.00,123,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (141,'Trenna','Rajs','TRAJS','650.121.8009','17-OCT-2003','ST_CLERK',3500.00,0.00,124,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (142,'Curtis','Davies','CDAVIES','650.121.2994','29-JAN-2005','ST_CLERK',3100.00,0.00,124,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (143,'Randall','Matos','RMATOS','650.121.2874','15-MAR-2006','ST_CLERK',2600.00,0.00,124,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (144,'Peter','Vargas','PVARGAS','650.121.2004','09-JUL-2006','ST_CLERK',2500.00,0.00,124,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (145,'John','Russell','JRUSSEL','011.44.1344.429268','01-JAN-2004','SA_MAN',14000.00,0.40,100,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (146,'Karen','Partners','KPARTNER','011.44.1344.467268','05-JAN-2005','SA_MAN',13500.00,0.30,100,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278','10-MAR-2005','SA_MAN',12000.00,0.30,100,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268','15-OCT-2007','SA_MAN',11000.00,0.30,100,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','29-JAN-2008','SA_MAN',10500.00,0.20,100,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (150,'Peter','Tucker','PTUCKER','011.44.1344.129268','30-JAN-2005','SA_REP',10000.00,0.30,145,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (151,'David','Bernstein','DBERNSTE','011.44.1344.345268','24-MAR-2005','SA_REP',9500.00,0.25,145,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (152,'Peter','Hall','PHALL','011.44.1344.478968','20-AUG-2005','SA_REP',9000.00,0.25,145,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (153,'Christopher','Olsen','COLSEN','011.44.1344.498718','30-MAR-2006','SA_REP',8000.00,0.20,145,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668','09-DEC-2006','SA_REP',7500.00,0.20,145,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508','23-NOV-2007','SA_REP',7000.00,0.15,145,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (156,'Janette','King','JKING','011.44.1345.429268','30-JAN-2004','SA_REP',10000.00,0.35,146,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (157,'Patrick','Sully','PSULLY','011.44.1345.929268','04-MAR-2004','SA_REP',9500.00,0.35,146,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (158,'Allan','McEwen','AMCEWEN','011.44.1345.829268','01-AUG-2004','SA_REP',9000.00,0.35,146,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (159,'Lindsey','Smith','LSMITH','011.44.1345.729268','10-MAR-2005','SA_REP',8000.00,0.30,146,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (160,'Louise','Doran','LDORAN','011.44.1345.629268','15-DEC-2005','SA_REP',7500.00,0.30,146,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (161,'Sarath','Sewall','SSEWALL','011.44.1345.529268','03-NOV-2006','SA_REP',7000.00,0.25,146,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (162,'Clara','Vishney','CVISHNEY','011.44.1346.129268','11-NOV-2005','SA_REP',10500.00,0.25,147,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (163,'Danielle','Greene','DGREENE','011.44.1346.229268','19-MAR-2007','SA_REP',9500.00,0.15,147,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (164,'Mattea','Marvins','MMARVINS','011.44.1346.329268','24-JAN-2008','SA_REP',7200.00,0.10,147,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (165,'David','Lee','DLEE','011.44.1346.529268','23-FEB-2008','SA_REP',6800.00,0.10,147,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (166,'Sundar','Ande','SANDE','011.44.1346.629268','24-MAR-2008','SA_REP',6400.00,0.10,147,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (167,'Amit','Banda','ABANDA','011.44.1346.729268','21-APR-2008','SA_REP',6200.00,0.10,147,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (168,'Lisa','Ozer','LOZER','011.44.1343.929268','11-MAR-2005','SA_REP',11500.00,0.25,148,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (169,'Harrison','Bloom','HBLOOM','011.44.1343.829268','23-MAR-2006','SA_REP',10000.00,0.20,148,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (170,'Tayler','Fox','TFOX','011.44.1343.729268','24-JAN-2006','SA_REP',9600.00,0.20,148,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (171,'William','Smith','WSMITH','011.44.1343.629268','23-FEB-2007','SA_REP',7400.00,0.15,148,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (172,'Elizabeth','Bates','EBATES','011.44.1343.529268','24-MAR-2007','SA_REP',7300.00,0.15,148,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (173,'Sundita','Kumar','SKUMAR','011.44.1343.329268','21-APR-2008','SA_REP',6100.00,0.10,148,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (174,'Ellen','Abel','EABEL','011.44.1644.429267','11-MAY-2004','SA_REP',11000.00,0.30,149,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266','19-MAR-2005','SA_REP',8800.00,0.25,149,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265','24-MAR-2006','SA_REP',8600.00,0.20,149,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (177,'Jack','Livingston','JLIVINGS','011.44.1644.429264','23-APR-2006','SA_REP',8400.00,0.20,149,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (178,'Kimberely','Grant','KGRANT','011.44.1644.429263','24-MAY-2007','SA_REP',7000.00,0.15,149,0);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (179,'Charles','Johnson','CJOHNSON','011.44.1644.429262','04-JAN-2008','SA_REP',6200.00,0.10,149,80);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (180,'Winston','Taylor','WTAYLOR','650.507.9876','24-JAN-2006','SH_CLERK',3200.00,0.00,120,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (181,'Jean','Fleaur','JFLEAUR','650.507.9877','23-FEB-2006','SH_CLERK',3100.00,0.00,120,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (182,'Martha','Sullivan','MSULLIVA','650.507.9878','21-JUN-2007','SH_CLERK',2500.00,0.00,120,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (183,'Girard','Geoni','GGEONI','650.507.9879','03-FEB-2008','SH_CLERK',2800.00,0.00,120,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (184,'Nandita','Sarchand','NSARCHAN','650.509.1876','27-JAN-2004','SH_CLERK',4200.00,0.00,121,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (185,'Alexis','Bull','ABULL','650.509.2876','20-FEB-2005','SH_CLERK',4100.00,0.00,121,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (186,'Julia','Dellinger','JDELLING','650.509.3876','24-JUN-2006','SH_CLERK',3400.00,0.00,121,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (187,'Anthony','Cabrio','ACABRIO','650.509.4876','07-FEB-2007','SH_CLERK',3000.00,0.00,121,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (188,'Kelly','Chung','KCHUNG','650.505.1876','14-JUN-2005','SH_CLERK',3800.00,0.00,122,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (189,'Jennifer','Dilly','JDILLY','650.505.2876','13-AUG-2005','SH_CLERK',3600.00,0.00,122,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (190,'Timothy','Gates','TGATES','650.505.3876','11-JUL-2006','SH_CLERK',2900.00,0.00,122,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (191,'Randall','Perkins','RPERKINS','650.505.4876','19-DEC-2007','SH_CLERK',2500.00,0.00,122,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (192,'Sarah','Bell','SBELL','650.501.1876','04-FEB-2004','SH_CLERK',4000.00,0.00,123,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (193,'Britney','Everett','BEVERETT','650.501.2876','03-MAR-2005','SH_CLERK',3900.00,0.00,123,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (194,'Samuel','McCain','SMCCAIN','650.501.3876','01-JUL-2006','SH_CLERK',3200.00,0.00,123,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (195,'Vance','Jones','VJONES','650.501.4876','17-MAR-2007','SH_CLERK',2800.00,0.00,123,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (196,'Alana','Walsh','AWALSH','650.507.9811','24-APR-2006','SH_CLERK',3100.00,0.00,124,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (197,'Kevin','Feeney','KFEENEY','650.507.9822','23-MAY-2006','SH_CLERK',3000.00,0.00,124,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (198,'Donald','OConnell','DOCONNEL','650.507.9833','21-JUN-2007','SH_CLERK',2600.00,0.00,124,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (199,'Douglas','Grant','DGRANT','650.507.9844','13-JAN-2008','SH_CLERK',2600.00,0.00,124,50);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (200,'Jennifer','Whalen','JWHALEN','515.123.4444','17-SEP-2003','AD_ASST',4400.00,0.00,101,10);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (201,'Michael','Hartstein','MHARTSTE','515.123.5555','17-FEB-2004','MK_MAN',13000.00,0.00,100,20);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (202,'Pat','Fay','PFAY','603.123.6666','17-AUG-2005','MK_REP',6000.00,0.00,201,20);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (203,'Susan','Mavris','SMAVRIS','515.123.7777','07-JUN-2002','HR_REP',6500.00,0.00,101,40);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (204,'Hermann','Baer','HBAER','515.123.8888','07-JUN-2002','PR_REP',10000.00,0.00,101,70);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (205,'Shelley','Higgins','SHIGGINS','515.123.8080','07-JUN-2002','AC_MGR',12000.00,0.00,101,110);
INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) VALUES  (206,'William','Gietz','WGIETZ','515.123.8181','07-JUN-2002','AC_ACCOUNT',8300.00,0.00,205,110);

COMMIT;
-- 1. Write a Oracle SQL query to get the details of all employees and also display the specific information of all employees.
select * from employees;
select COUNT(*) from employees;

-- Write a Oracle SQL command to display the employee name, job and annual salary for all employees
select first_name||' '||last_name as employee_name, job_id, salary*12+commission_pct "Annual Salary"
from employees;

-- 3. Write a Oracle SQL query to get the total number of employees working in the company.
select count(*) "Total No. Of Employees"
from employees;

-- 5. Write a Oracle SQL query to get the maximum and minimum salary from the employees table
select max(salary) "Max Sal",min(salary) "Min Sal"
from employees;

-- 6. Write a Oracle SQL query to display the name of the employees in order to earning from lowest salary to highest.
select first_name||' '||last_name as employee_name, salary
from employees
order by salary;

-- 7. Write a Oracle SQL query to display the name of the employees in order to earning from highest salary to lowest.
select first_name||' '||last_name as employee_name, salary
from employees
order by salary desc;

-- 8. Write a Oracle SQL query to display the name of the employees in order to alphabetically ascending order.
select first_name||' '||last_name as employee_name, salary
from employees
order by first_name;

-- 9. Write a Oracle SQL query to display employee id, name, department no, salary of the employees. 
-- The output first based on the employee name in ascending order, for unique name department will come in ascending order, 
-- and for same name and department the highest salary will come first.

select employee_id ID,first_name||' '||last_name as employee_name,department_id,salary
from employees
order by first_name,department_id;

-- 10. Write a Oracle SQL query to display the name and their annual salary. The result should contain those employees first who earning the highest salary.
select employee_id ID,first_name||' '||last_name as employee_name,salary*12 "Annual Salary"
from employees
order by salary desc;

-- 11. Write a Oracle SQL query to display department id and total number of employees working in each department.
select department_id,count(department_id)
from employees
group by department_id;

-- 12. Write a Oracle SQL query to display the designation (job id) and total number of employees working in each designation.
select job_id "Designation",count(job_id)
from employees
group by job_id
order by job_id;

-- 13. Write a Oracle SQL query to display the department number and total salary for each department.
select department_id, sum(salary)
from employees
group by department_id;

-- 14. Write a Oracle SQL query to display the department number and maximum salary for each department.
select department_id, max(salary) as max_sal
from employees
group by department_id;

-- 15. Write a Oracle SQL query to display the designations (job id) and total salary allotted for each designation from the company.

select job_id,sum(salary) "Allotted Salary"
from employees
group by job_id;


-- Oracle Operator [14 exercises with solution]
-- -----------------------------------------------

-- 1. Write a query to list the name of all the employees who are working in department number 20.
select first_name||' '||last_name as employee_name
from employees
where department_id=20;

--2. Write a query to list the employees name and total salary of a year and yearly salary is more than ₹10000.
    select first_name,last_name, salary*12 "Yearly Salary ₹"
    from employees
    where (salary*12)>10000;
--3. Write a query to list the employees name and salary who?s daily salary is more than $100.
    select first_name,last_name,salary,salary/30 "monthly sal"
    from employees
    where (salary/30)>100;
    
--    select TRUNC(sysdate, 'MM') from dual;
    
--4. Write a query to list the name of all the employees who are not working in department number 20.
    select first_name,last_name,department_id
    from employees
    where department_id<>20;
--5. Write a query to list the name of all the employees who are working as account manager and drawing a salary more than $5000.
    select first_name||' '||last_name employee
    from employees
    where job_id='AC_MGR' and salary>5000;
    
--6. Write a query to list the names of all the employees who are working as accountant in finance section and drawing a salary less than $20000.
    
    select first_name||' '||last_name employee
    from employees
    where job_id='FI_ACCOUNT' and salary<20000;
    
--7. Write a query to list the name of all the employees who are working as accountant in finance section and drawing a salary is greater than equal to $5000 and less than equal to $20000.
    select first_name||' '||last_name employee
    from employees
    where job_id='FI_ACCOUNT' and salary BETWEEN 5000 AND 20000;
--8. Write a query to list the names, salary of all the employees who are working with a commission package.
     select first_name||' '||last_name employee, salary, commission_pct 
     from employees
     where commission_pct IS NOT NULL and commission_pct<>0;
    
--9. Write a query to list the name, salary of all the employees where employee first name belongs in a specified list.
         
     select first_name||' '||last_name employee, salary, commission_pct 
     from employees
     where first_name IN ('John','Gerald','Karen');

--10. Write a query to list the first name, last name, Job id of all the employees except "IT_PROG " & " FI_ACCOUNT" in asc order of Salaries.
        select first_name,last_name,job_id,salary
        from employees
        where job_id not in ('IT_PROG','FI_ACCOUNT')
        order by salary;

--11. Write a query to list the name (first and last name), hire date of all the employees who joined before or after 2005.
        select first_name,last_name,job_id,hire_date
        from employees
        where (to_char(hire_date,'yyyy')not in ('2005'));
        
        
        select first_name,last_name,job_id,hire_date
        from employees
        where (to_char(hire_date,'yyyy')!='2005');
        
        

--12. Write query to list the name (first and last name), hire date of all the employees who joined on 1-JUL-2006,24-MAR-2007,04-JAN-2008 in ascending order of seniority.
        select first_name,last_name,job_id,hire_date
        from employees
        where hire_date in ('1-JUL-2006','24-MAR-2007','04-JAN-2008')
        order by hire_date asc;

--13. Write a query to concatenate first name, last name and job id from employees table in the following format.
         select first_name||' '||last_name||' is a '||job_id 
         from employees;
         -- the other way
         SELECT CONCAT (CONCAT (CONCAT(CONCAT(first_name,' '),last_name), ' is a '),job_id) 
            FROM employees 
            WHERE salary > 2000;


--14. Write a query to list the employees who are joined in the year between '01-Jan-2004' and '31-Dec-2008'.

    select first_name||' '||last_name, hire_date "Joined on"
    from employees
    where hire_date between '01-Jan-2004' and '31-Dec-2008';
    
    
-- Oracle Wildcard special Operators - Exercises
-- -----------------------------------------------

-- 1. Write a query to list the names (first and last) of those employees whose name starts with A.
        
        select first_name||' '||last_name
        from employees
        where first_name like 'A%';

-- 2. Write a query to list the names (first and last) of those employees whose last name ends with a.
        select first_name||' '||last_name
        from employees
        where last_name like '%a' or last_name like '%A';


-- 3. Write a query to list the names (first and last) of those employees whose name have second alphabet 's' in their names.
        select first_name||' '||last_name
        from employees
        where first_name like '_s%';


-- 4. Write a query to list the names (first and last) of those employees whose first name has only five characters.
        select first_name||' '||last_name
        from employees
        where first_name like '_____';

-- 5. Write a query to list the names (first and last) of those employees whose first name has only five characters and starts with 'A'.
        select first_name||' '||last_name
        from employees
        where first_name  like 'a____' or first_name like 'A____';


-- 6. Write a query to list the names (first and last) of those employees whose first name has only five characters and last name have third alphabet ends with 's'.
        select first_name||' '||last_name
        from employees
        where (first_name  like '_____') and (last_name like '_____');



-- 7. Write a query to list the names (first and last) of the employees whose first name has only five characters and starting with 'S' and ending with 'n'.

        select first_name||' '||last_name
        from employees
        where (upper(first_name)  like 'S___N' );
        
   --      select first_name||' '||last_name from employees;

-- 8. Write a query to list the names (first and last), hire date of those employees who joined in the month of which second character is 'u'.
        select first_name||' '||last_name, hire_date
        from employees
        where (to_char(hire_date,'MON') like '_U%' );
        
   --     select to_char(sysdate,'MON') from dual;


-- 9. Write a query to list the names (first and last), salary of those employees whose salary is four digit number ending with Zero.

        select first_name||' '||last_name, salary
        from employees
        where salary like '___0';


-- 10. Write a query to list the names (first and last), salary of those employees whose names having a character set 'll' together.

          select first_name||''||last_name 
        from employees
        where (upper(first_name) like '%LL%');


-- 11. Write a query to list first_name, last_name of employees with the pattern 'l_x' in their first name.
         select first_name||''||last_name 
        from employees
        where (upper(first_name) like '%L_X%');


-- Oracle Datetime - Exercises 
-- ----------------------------
-- 1. Write a Oracle SQL statement to get the first day of the current month.
    
        select trunc(sysdate,'mon') "First Day of Current Month"
        from dual;
        
--        select first_name||' '||last_name,trunc(hire_date,'mm') "First Day of Current Month"
--        from employees;

        SELECT 
            TRUNC(DATE '2035-08-22', 'D') AS "D",
            TRUNC(DATE '2035-08-22', 'DD') AS "DD",
            TRUNC(DATE '2035-08-22', 'MONTH') AS "Month",
            TRUNC(DATE '2035-08-22', 'YEAR') AS "Year",
            TRUNC(DATE '2035-08-22', 'CC') AS "CC"
        FROM DUAL;
        
        select Next_day(sysdate-10,'sunday') from dual;


-- 2. Write a Oracle SQL statement to get the last date of the current month.

    select trunc(last_day(sysdate)) from dual;


--3. Write a Oracle SQL statement to get the current date in the specified session time zone.
--        ALTER SESSION SET TIME_ZONE = '-8:0';
--        ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';
        SELECT SESSIONTIMEZONE, CURRENT_DATE FROM DUAL;
--        ALTER SESSION SET TIME_ZONE = '-9:0';
        SELECT SESSIONTIMEZONE, CURRENT_DATE FROM DUAL;


    select sessiontimezone, sysdate from dual;



--4. Write a Oracle SQL statement to determine how many days are left in the current month.

    SELECT SYSDATE,
       LAST_DAY(SYSDATE) "Last",
       LAST_DAY(SYSDATE) - SYSDATE "Days Left"
    FROM DUAL;


--5. Write a Oracle SQL statement to get the first and last day of the current year.
SELECT TRUNC(SYSDATE, 'YEAR') "First Day of the year", ADD_MONTHS (TRUNC(SYSDATE, 'YEAR'), 12) - 1 "Last Day of the Year" FROM DUAL;

--6. Write a Oracle SQL statement to get the number of days in current month.
SELECT CAST (TO_CHAR (LAST_DAY (SYSDATE), 'dd') AS INT) number_of_days FROM DUAL; 

--7. Write a Oracle SQL statement to get number of days between two given dates.
    SELECT ROUND ((MONTHS_BETWEEN ('01-May-2024', '01-Dec-2023') * 30), 0) num_of_days FROM DUAL;  
    
    SELECT
    DATE '2024-05-01' - DATE '2023-12-01' AS num_of_days FROM dual; -- this will give accurate days as in some months have 30 days and some 31 days.
    
    SELECT
    TO_DATE('01-May-2024','DD-MON-YYYY')- TO_DATE('01-Dec-2023','DD-MON-YYYY') AS num_of_days
    FROM dual;
        /*
        
        | Requirement       | Use                              |
        | ----------------- | -------------------------------- |
        | Exact days        | 'date1 - date2'                 |
        | Full months       | 'MONTHS_BETWEEN'                |
        | Salary prorations | Calendar math + date subtraction |
        | Daily salary      | '(end_date - start_date + 1)'   |
        
        */



--8. Write a Oracle SQL statement to get the start date and end date of each month in current year from current month.
    
    -- for the year:
    SELECT TRUNC(SYSDATE, 'YEAR') "First Day of the year", ADD_MONTHS (TRUNC(SYSDATE, 'YEAR'), 12) - 1 "Last Day of the Year" FROM DUAL;

    -- for each month:
    
    SELECT ADD_MONTHS (TRUNC (SYSDATE, 'MONTH'), i) start_date,
    TRUNC (LAST_DAY (ADD_MONTHS (SYSDATE, i))) end_date 
    FROM XMLTABLE ('for $i in 0 to xs:int(D) 
                   return $i'PASSING XMLELEMENT (d,FLOOR (MONTHS_BETWEEN (ADD_MONTHS (TRUNC (SYSDATE, 'YEAR') - 1, 12),  SYSDATE)))COLUMNS i INTEGER PATH '.');  


-- SELECT ROUND ((MONTHS_BETWEEN ('01-May-2024', '01-Dec-2023') * 30), 0) num_of_days FROM DUAL;  

SELECT round(MONTHS_BETWEEN ('01-May-2024', '01-Dec-2023')) num_of_months FROM DUAL;  
-- EXTRACT   (DATETIME FUNCTION)
/*
In Oracle Database, the EXTRACT(datetime) function extracts and returns the value of a specified datetime field from a datetime or interval expression.

Syntax
The syntax goes like this:

EXTRACT( { YEAR
         | MONTH
         | DAY
         | HOUR
         | MINUTE
         | SECOND
         | TIMEZONE_HOUR
         | TIMEZONE_MINUTE
         | TIMEZONE_REGION
         | TIMEZONE_ABBR
         }
         FROM { expr }
       )
Where expr is any expression that evaluates to a datetime or interval data type compatible with the requested field.

The expr argument is treated as an ANSI datetime data type.
*/




SELECT EXTRACT(month FROM hire_date) "Month",hire_date
  FROM employees
  ORDER BY  "Month";

SELECT EXTRACT(day FROM hire_date) "Month",hire_date
  FROM employees
  ORDER BY  "day";

SELECT EXTRACT(YEAR FROM DATE '1998-03-07')
  FROM DUAL;
  
  
  SELECT EXTRACT(TIMEZONE_REGION FROM TIMESTAMP '1999-01-01 10:00:00 -05:00')
  FROM DUAL;
  
