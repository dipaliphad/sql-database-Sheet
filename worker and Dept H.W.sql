create table workers(
Id int primary key identity(1,1),
First_Name varchar(40),
Last_Name varchar(40),
Salary int,
Joining_Date DateTime,
Dept varchar(20)
)
select * from workers

select GETDATE()

insert into workers(First_Name,Last_Name,Salary,Joining_Date,Dept)values
('sagar','shrma',20000,'2022-11-13 14:24:05.913','HR'),
('kunal','verma',30000,'2022-11-13 14:24:05.913','Admin'),
('vishal','shrma',60000,'2022-11-13 14:24:05.913','HR'),
('Niharika','verma',20000,'2022-11-13 14:24:05.913','Admin'),
('vivek','Bhati',50000,'2022-11-13 14:24:05.913','Admin'),
('vipul','Diwan',70000,'2022-11-13 14:24:05.913','Account'),
('satish','kumar',80000,'2022-11-13 14:24:05.913','Account'),
('Geetika','Kumar',80000,'2022-11-13 14:24:05.913','Admin')

create table Bonus(
workers_Id int,
Bonus_Id int primary key identity(1,1),
Bonus_Amount int,
Bonus_Date DateTime,
constraint FK_worker_Bonus Foreign Key(workers_Id)REFERENCES workers(Id)
)
insert into Bonus values(1,5000,'2022-11-13 14:24:05.913')
insert into Bonus values(2,3000,'2022-11-13 14:24:05.913')
insert into Bonus values(3,4000,'2022-11-13 14:24:05.913')
insert into Bonus values(4,4500,'2022-11-13 14:24:05.913')
insert into Bonus values(1,3500,'2022-11-13 14:24:05.913')

select * from Bonus
delete from Bonus where workers_Id=2

create table Title(
workers_Id int,
workers_Title varchar(40),
Affected_from DateTime,
constraint FK_workers_Id Foreign Key(workers_Id)REFERENCES workers(Id),
)

insert into Title values(1,'Manager',2016-02-20)
insert into Title values(1,'Executive',2016-06-11)
insert into Title values(1,'Executive',2016-06-11)
insert into Title values(1,'Manager',2016-06-11)
insert into Title values(1,'Asst.Manager',2016-02-20)
insert into Title values(1,'Executive',2016-06-11)
insert into Title values(1,'Lead',2016-06-11)
insert into Title values(1,'Lead',2016-06-11)

select * from Title

--Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select First_Name as worker_name from workers

--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select UPPER(First_Name)from workers

--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select Distinct(Dept)from workers

--Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select substring(First_Name,1,3)from workers

--Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
select INSTR(First_Name,BINARY'a')from workers where First_Name='Abhi'

--Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select RTRIM(First_Name)from workers

--Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select LTRIM(Dept)from worker

--Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct length(Dept)from workers

--9Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select REPLACE(First_Name,'a','A')from workers

--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select CONCAT(First_Name, ' ',Last_Name)As 'COMPLETE_NAME'from workers

--Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select *from worker order by First_Name asc

--Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select *from workers order by First_Name asc, Dept desc

--Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select *from workers where First_Name in ('vipul','satish')

--Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from workers where First_Name not in ('vipul','satish')

--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from workers where Dept like 'Admin%'

--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from workers where First_Name like '%a%'

--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where First_Name like '%a'

--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from workers where First_Name like '______a'

--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from workers where Salary between 10000 and 50000

--Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from workers where year(Joining_Date)=2020 and month(Joining_Date)=6

--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select COUNT(*) from workers where Dept='Admin'

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM workers 
WHERE Id in 
(SELECT Id FROM workers 
WHERE Salary BETWEEN 50000 AND 100000);

--Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select Dept, COUNT(Id)No_Of_workers
from workers
group by Dept
order by No_Of_workers desc

--Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT DISTINCT W.FIRST_NAME, T.workers_Title
FROM Worker W
INNER JOIN Title T
ON W.ID = T.workers_Id
AND T.workers_Title in ('Manager');

--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT workers_Title, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY workers_Title, AFFECTED_FROM
HAVING COUNT(*) > 1;

--Q-26. Write an SQL query to show only odd rows from a table.
select * from workers where MOD (workers_Id,2)<>0

--Q-27. Write an SQL query to show only even rows from a table.
SELECT * FROM Workers WHERE MOD (WORKERs_ID, 2) = 0;

--Q-28. Write an SQL query to clone a new table from another table.
select * into workersClone from workers

--Q-29. Write an SQL query to fetch intersecting records of two tables.
select * from workers
intersect
(select * from workersClone)

--Q-30. Write an SQL query to show records from one table that another table does not have.
SELECT * FROM Workers
MINUS
SELECT * FROM Title

--Q-31. Write an SQL query to show the current date and time.
SELECT getDate()

--Q-32. Write an SQL query to show the top n (say 10) records of a table.
SELECT TOP 10 * FROM Workers ORDER BY Salary DESC;

--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT Salary FROM Worker ORDER BY Salary DESC LIMIT n-1,1

--Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
SELECT Salary
FROM Worker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 );

 --Q-35. Write an SQL query to fetch the list of employees with the same salary.
 Select distinct W.Id, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.Id != W1.Id

--Q-36. Write an SQL query to show the second highest salary from a table.
Select max(Salary) from Workers 
where Salary not in (Select max(Salary) from Workers);

--Q-37. Write an SQL query to show one row twice in results from a table.
select First_Name,Dept from workers w where w.Dept='HR'
union all
select First_Name,Dept from workers w1 where w1.Dept='HR'

--Q-38. Write an SQL query to fetch intersecting records of two tables.
select * from workers
INTERSECT
select *from workersClone

--Q-39. Write an SQL query to fetch the first 50% records from a table.
select * from workers
where Id <=(select COUNT(Id)/2 from workers)

--Q-40. Write an SQL query to fetch the departments that have less than five people in it.
select Dept,COUNT(Id) as 'number of workers' from workers group by Dept having COUNT(Id)<5

--Q-41. Write an SQL query to show all departments along with the number of people in there.
select Dept, COUNT(Dept) as 'number of workers'from workers group by Dept

--Q-42. Write an SQL query to show the last record from a table.
select * from workers where Id=(select max(Id)from workers)

--Q-43. Write an SQL query to fetch the first row of a table.
select * from workers where Id=(select min(Id)from workers)

--Q-44. Write an SQL query to fetch the last five records from a table.
select *from workers where Id<=5

--Q-45. Write an SQL query to print the name of employees having the highest salary in each department.


--Q-46. Write an SQL query to fetch three max salaries from a table.
select distinct Salary from workers a where 3>=(select COUNT(distinct Salary)from
workers b where a.Salary<=b.Salary) order by a.Salary desc

--Q-47. Write an SQL query to fetch three min salaries from a table.
select distinct Salary from workers a where 3>=(select COUNT(distinct Salary)from
workers b where a.Salary>=b.Salary)order by a.Salary desc

--Q-48. Write an SQL query to fetch nth max salaries from a table
select distinct Salary from workers a where n >=(select COUNT(distinct Salary)from
workers b where a.Salary<=b.Salary)order by a.Salary desc

--Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT Dept, sum(Salary) from worker group by Dept

--Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME, SALARY from Workers WHERE SALARY=(SELECT max(SALARY) from Workers)