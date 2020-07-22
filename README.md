# sql-challenge

DIAGRAM NOTES:

Each table was given a primary key, even if it was not specified in one of the columns of the actual csv. 
When the Primary Key was a mixture of numbers and letters, it was defined as a string using VARCHAR
The following one to one relationships exist
1. managers employee number from the departments_managers table and employee number from the employees table. This is because each manager in the department_manager table only managed one department. (There were no duplicate managers)
2. Emp_no in the salaries table and emp_no in the employees table as each employee can only be paid one salary 
Other relationships are usually one to many as shown by the picture. 
