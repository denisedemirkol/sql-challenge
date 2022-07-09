/*
 * 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
 */

Select e.empno      "Employee number", 
       e.last_name  "Last name", 
       e.first_name "First name", 
       CASE WHEN e.sex = 'F' Then 'Female'
            WHEN e.sex = 'M' Then 'Male'
            ELSE e.sex END "Sex",
       s.salary
From employees e
INNER JOIN salaries s ON (e.empno = s.empno)

/*
 * 2. List first name, last name, and hire date for employees who were hired in 1986.
 */
 
 
Select 
       e.last_name  "Last name", 
       e.first_name "First name",
       TO_DATE(e.hire_date ,'MM/DD/YYYY') "Hire Date"
  From employees e 
 Where 1=1
   and EXTRACT(YEAR FROM TO_DATE(e.hire_date ,'MM/DD/YYYY')) = 1986
   

/*
 * 3. List the manager of each department with the following information: 
 *    department number, department name, the manager's employee number, last name, first name.
 */
 
 
 Select d.deptno    "Department Number",
        d.deptname  "Department Name",
        dm.empno    "Manager Emp No",
        e.last_name "Last Name",
        e.first_name "First Name"
   From departments d
INNER JOIN dept_manager dm ON (dm.deptno = d.deptno) 
INNER JOIN employees e ON (dm.empno = e.empno)

/*
 * 4. List the department of each employee with the following information: 
 *    employee number, last name, first name, and department name.
 */
 
  
Select e.empno      "Employee Number",
       e.last_name  "Last name", 
       e.first_name "First name",
       d.deptname   "Department"   
  From employees e
INNER JOIN dept_emp  de ON (e.empno = de.empno)       
INNER JOIN departments d ON (d.deptno = de.deptno)



 /*
  * 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B." 
  */
   
Select 
       e.first_name "First name",
       e.last_name  "Last name", 
       CASE WHEN e.sex = 'F' Then 'Female'
            WHEN e.sex = 'M' Then 'Male'
            ELSE e.sex END "Sex"     
  From employees e 
 Where 1=1
   and e.first_name = 'Hercules'
   and e.last_name LIKE 'B%'
   
   
/*
 * 6. List all employees in the Sales department, 
 *    including their employee number, last name, first name, and department name.
 */
 
  
Select e.empno      "Employee Number",
       e.last_name  "Last name", 
       e.first_name "First name",
       d.deptname   "Department"   
  From employees e
INNER JOIN dept_emp  de ON (e.empno = de.empno)       
INNER JOIN departments d ON (d.deptno = de.deptno)   
WHERE d.deptname = 'Sales'


   
/*
 * 7. List all employees in the Sales and Development departments, 
 * including their employee number, last name, first name, and department name.
 */
 
  
Select e.empno      "Employee Number",
       e.last_name  "Last name", 
       e.first_name "First name",
       d.deptname   "Department"   
  From employees e
INNER JOIN dept_emp  de ON (e.empno = de.empno)       
INNER JOIN departments d ON (d.deptno = de.deptno)   
WHERE d.deptname IN ('Sales','Development')


/*
 * 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
 */
 
 Select 
       e.last_name  "Last name",
       Count(*) "Frequency Count"
  From employees e 
 Where 1=1
   Group By e.last_name
Order By  Count(*) Desc  