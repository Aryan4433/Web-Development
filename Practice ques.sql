use IB;
select * from workers_ib;
select * from workers_position;
#Write a query to fetch the EmpFname from the worker_ib table in the upper case and use the ALIAS name as EmpName.
select Upper(E_fname) from workers_ib as EmpName;

#Write a query to fetch the number of employees working in the department ‘HR’.
select count(*) from workers_ib where department="HR";

##Write a query to get the current date.
select current_date();

##Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table
select substring(E_Lname,1,4) from workers_ib;

#Write a query to create a new table that consists of data and structure copied from the other table.
create table amm as select * from workers_ib;
select * from amm;

#Write a query to find all the employees whose salary is between 50000 to 100000.
select * from workers_position where salary between 50000 and 100000;

#Write a query to find the names of employees that begin with ‘S’
select * from workers_ib where E_fname Like("S%");

#Write a query to fetch top N records.
select * from workers_position order by salary limit 2;

#Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.
select concat(E_fname,' ',E_lname) as Full_Name from workers_ib;

#Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/2022 and are grouped according to gender
select count(*) , gender from workers_ib where DOB Between '1970-05-02' and '2022-12-31' group by gender;

#Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.
select * from workers_ib order by E_Lname desc, Department asc; 

#Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.
select * from workers_ib where E_lname Like('_____A%');

# Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.
select * from workers_ib where E_fname not in ("Sanjay","Sonia");

#Write a query to fetch details of employees with the address as “DELHI(DEL)”
select * from workers_ib where address="DELHI(DEL)";

##Write a query to fetch all employees who also hold the managerial position.

select * from workers_ib I inner join workers_position P on I.EmpID = P.EmpID;

#Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.
select count(*), department from workers_ib group by department order by department asc;

#Write a query to calculate the even and odd records from a table.
select * from workers_ib as even where MOD(EmpID,2)=0   Union  select * from workers_ib as odd where MOD(EmpID,2)<>0;

#Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.
SELECT * FROM WORKERS_IB AS E WHERE EXISTS (SELECT * FROM WORKERS_POSITION P WHERE E.EmpID = P.EmpID);

##Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.
select salary as maximum_salary from workers_position order by salary desc limit 2 ;
select salary as minimum_salary from workers_position order by salary asc limit 2 ;

#find 2nd hihest salary
select * from workers_position as E1 where 2-1 = (select count(distinct(salary)) from workers_position as E2 where E2.salary>E1.salary);

#find 2nd lowest salary
select * from workers_position as E1 where 2-1 = (select count(distinct(salary)) from workers_position as E2 where E2.salary<E1.salary);

#Write a query to retrieve the list of employees working in the same department.
select * from workers_ib as E , workers_ib as I where I.EmpID <> E.EmpID and I.department = E.department;


# Write a query to retrieve the last 3 records from the EmployeeInfo table.
SELECT * FROM workers_ib ORDER BY EmpID DESC LIMIT 3;

#Write a query to display the first and the last record from the EmployeeInfo table.
select * from workers_ib where EmpID =(select min(EmpID) from workers_ib);
select * from workers_ib where EmpID =(select max(EmpID) from workers_ib);

##Write a query to retrieve Departments who have less than 2 employees working in it.
select count(*), department from workers_ib group by department having count(*)<2; 

#Write a query to retrieve EmpPostion along with total salaries paid for each of them.
select E_position, sum(salary) from workers_position group by E_position;

## Write a query to fetch 50% records from the EmployeeInfo table.
select * from workers_ib where EmpId <= (select count(empId)/2 from workers_ib);


select * from workers_ib;