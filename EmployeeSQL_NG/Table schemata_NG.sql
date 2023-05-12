--List the employee number, last name, first name, sex, and salary of each employee 
--From joined tables Employee and Salaries
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees
Inner join Salaries on
Employees.emp_no= Salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
--From table Employee only
SELECT first_name, last_name, hire_date
FROM Employees
Where EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name
--From joined tables Dept_manager,Employees and Department
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Dept_manager.dept_no , Department.dept_name
FROM Dept_manager
Inner join Employees on
Employees.emp_no= Dept_manager.emp_no
Inner join Department on
Dept_manager.dept_no = Department.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
--From joined tables Dept_employee,Employees and Department
SELECT Department.dept_no, Employees.emp_no, Employees.last_name, Employees.first_name,Department.dept_name
FROM Dept_employee
Inner join Employees on
Employees.emp_no= Dept_employee.emp_no
Inner join Department on
Dept_employee.dept_no = Department.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
--From table Employee only
SELECT first_name, last_name, sex
FROM Employees
Where first_name = 'Hercules'
And last_name like'B%';

--List each employee in the Sales department, including their employee number, last name, and first name
--From joined tables Employees, Dept_employee and Department
SELECT Employees.emp_no, Employees.last_name, Employees.first_name
FROM Dept_employee
Inner join Employees on
Employees.emp_no= Dept_employee.emp_no
Inner join Department on
Dept_employee.dept_no = Department.dept_no
Where dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
--From joined tables Employees, Dept_employee and Department
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Department.dept_name
FROM Dept_employee
Inner join Employees on
Employees.emp_no= Dept_employee.emp_no
Inner join Department on
Dept_employee.dept_no = Department.dept_no
Where dept_name = 'Sales'
or dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
--From table Employee only
SELECT Count(last_name) as "Frequency_Last name", last_name
FROM Employees
Group by last_name
Order by "Frequency_Last name" DESC;





