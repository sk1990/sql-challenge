DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
-- Create tables
--create table departments
CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);
--import CSV file
select *
FROM departments;
--create table dept_emp
CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL
);
select *
FROM dept_emp;
--create table dept_manager
CREATE TABLE dept_manager (
	dept_no VARCHAR   NOT NULL,
	emp_no INT   NOT NULL
	
);
select *
FROM dept_manager;

--create table employees
CREATE TABLE employees (
	emp_no INT   NOT NULL,
	emp_title VARCHAR NOT NULL,
	birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
	
);
-- Import CSV file
select *
FROM employees;
  
--create table salaries
CREATE TABLE salaries (
	emp_no INT   NOT NULL,
	salary INT NOT NULL
		
);
-- Import CSV file
select *
FROM salaries;

--create table titles
create table titles(
	title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL

);
select *
FROM titles;
-- answer questions
--List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
From employees
JOIN salaries ON employees.emp_no=salaries.emp_no
--List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name,hire_date
FROM employees
WHERE hire_date >'1985-12-31' AND hire_date <'1987-01-01'; 
-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select departments.dept_no,  departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager ON  departments.dept_no=dept_manager.dept_no
JOIN employees ON employees.emp_no=dept_manager.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
Select departments.dept_name, employees.last_name, employees.first_name,dept_emp.emp_no
FROM employees
JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
JOIN departments ON departments.dept_no=dept_emp.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) FROM employees
GROUP BY last_name 
ORDER BY COUNT(last_name) DESC;








