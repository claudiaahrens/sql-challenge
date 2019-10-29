--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT emp_no, last_name, first_name, gender, salary
FROM employees
JOIN salaries
ON salaries.em_no = employees.emp_no
ORDER BY salary DESC

--List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date LIKE '1986-%'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dept_no, dept_name, employees.emp_no, last_name, first_name, from_date, to_date
FROM dept_managers
JOIN employees
ON dept_managers.emp_no = employees.emp_no
JOIN departments
ON dept_managers.dept_no = departments.dept_no
ORDER BY emp_no DESC

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees 
JOIN dept_employees
ON dept_employees.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_employees.dept_no
ORDER BY emp_no DESC

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name ASC

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees 
JOIN dept_employees
ON dept_employees.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_employees.dept_no
WHERE dept_name LIKE 'Sales'
ORDER BY last_name ASC

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees 
JOIN dept_employees
ON dept_employees.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_employees.dept_no
WHERE dept_name LIKE 'Sales' OR dept_name LIKE 'Development'
ORDER BY dept_name ASC, last_name ASC

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Total Count"
FROM employees 
GROUP BY last_name
ORDER BY Count(last_name) DESC