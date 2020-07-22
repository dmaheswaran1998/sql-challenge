/* Data Analysis section */

/* First need to merge the employees and the salaries database  (listing employee details and salary)
Data Analysis - Point 1 */

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
  ON employees.emp_no = salaries.emp_no
  
 
 /* Data Analysis - Point 2 (hire date 1986). Last four characters = 1986 */
 

 
 SELECT employees.first_name, employees.last_name,  employees.hire_date
 FROM employees
 WHERE RIGHT(hire_date, 4)='1986'

/* Data Analysis - Point 3 - manager of each department with information */

select * from departments

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments
  ON dept_manager.dept_no = departments.dept_no
JOIN employees
  ON dept_manager.emp_no = employees.emp_no
 

/* Data Analysis- Point 4- employee of each department with relevant information */

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN departments
  ON dept_emp.dept_no = departments.dept_no
JOIN employees
  ON dept_emp.emp_no = employees.emp_no
 
/* Data Analysis - Point 5 - first name Hercules and Last name begins with B */
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name='Hercules' AND LEFT(last_name, 1)='B'

/* Data Analysis - Point 6 - All employees in the Sales Departments.*/
/* Rather than using subqueries, I saved the join table as a new table (emp_join) and then queried this table*/

CREATE TABLE emp_join AS
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN departments
  ON dept_emp.dept_no = departments.dept_no
JOIN employees
  ON dept_emp.emp_no = employees.emp_no

  
  /* in Order for this to work, this table create command needs to be run separately to the query below. 
  Please run the table command above completely separately to the query below. Below is Query 6*/

SELECT emp_no, last_name, first_name, dept_name
FROM emp_join
WHERE dept_name='Sales'
 
 /* Data Analysis - Point 7 - All employees in the Sales and Development Departments.*/
/* Once again I used the join table I created in the last one (emp_join) and then queried this table*/

 SELECT emp_no, last_name, first_name, dept_name
 FROM emp_join
 WHERE dept_name='Sales' OR dept_name='Development'
 
 /* Data Analysis- Point 8 - ordering the employees last name by frequency) */ 
 
SELECT last_name, COUNT(last_name) AS "employee_last count"
FROM employees
GROUP BY last_name
ORDER BY "employee_last count" DESC;

 