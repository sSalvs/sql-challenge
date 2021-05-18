-- queries

-- check tables populated correctly  
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
CREATE VIEW Question_1 AS
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees 
INNER JOIN salaries ON 
employees.emp_no = salaries.salary;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

CREATE VIEW Question_2 AS
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;


-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.

CREATE VIEW Question_3 AS
SELECT dept_manager.dept_no,
	departments.dept_name,
	employees.emp_no, 
	employees.last_name, 
	employees.first_name
FROM employees
INNER JOIN dept_manager on 
employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

CREATE VIEW Question_4 AS
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp on 
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

CREATE VIEW Question_5 AS
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

CREATE VIEW Question_6 AS	
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp on 
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' 

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

CREATE VIEW Question_7 AS
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp on 
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name IN ('Sales', 'Development')

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

CREATE VIEW Question_8 AS
SELECT last_name, COUNT(last_name) AS "Number of Employees with the same Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Number of Employees with the same Last Name" DESC;

-- Epilogue
SELECT employees.first_name, employees.last_name 
FROM employees
WHERE emp_no = 499942