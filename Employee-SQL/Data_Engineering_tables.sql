-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Jti5b6
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
--saved all primary keys except emp_no as a string as it includes numbers and letters
--only rows with not null as a constratint are the primary key ones


CREATE TABLE titles (
    title_id VARCHAR(50)  NOT NULL,
    title VARCHAR(50),
    PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(50),
    birth_date VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex VARCHAR(5),
    hire_date VARCHAR(50), 
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT ,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no, salary)
);

CREATE TABLE departments (
    dept_no VARCHAR(50)  NOT NULL,
    dept_name VARCHAR(50),
    PRIMARY KEY (dept_no)
   
);

CREATE TABLE dept_emp (
    emp_no INT  NOT NULL,
    dept_no VARCHAR(50)   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(50)   NOT NULL,
    emp_no  INT  NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no, emp_no)
    );
