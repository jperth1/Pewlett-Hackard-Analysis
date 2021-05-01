-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR (4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

CREATE TABLE department_employees(
	emp_no INT NOT NULL,
	dept_no VARCHAR (4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE titles(
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

--Query for Confirmation
SELECT * FROM departments;


--Query employees between 1952-1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

--Query employees born in 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

--Query employees born in 1953
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

--Query employees born in 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

--Query employees born in 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees eligible to retire 
-- and eligibile for retirement package
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create New Table "retirement_info" from Retirement eligibility queries
SELECT first_name, last_name, emp_no
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--View retirement table
SELECT * FROM retirement_info

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
	retirement_info.first_name,
	retirement_info.last_name,
	department_employees.to_date
FROM retirement_info
LEFT JOIN department_employees 
ON retirement_info.emp_no = department_employees.emp_no;

--Use Alias 
SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
	de.to_date
FROM retirement_info as ri
LEFT JOIN department_employees as de
ON ri.emp_no = de.emp_no;

SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Create table Current_Emp of all 
--retirement eligible employeers still employed at PH, 
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN department_employees as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO dept_count
FROM current_emp as ce
LEFT JOIN department_employees as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

--Make Employee_Info list
--sort salaries in decsending order
SELECT * FROM salaries
ORDER BY to_date DESC;

--Create Emp_info table that queries 
--retiring employees currently at PH 
--eligible for retirement package and 
--their current salaries
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN department_employees as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

--Create Management_Info table that queries
--department managers that are 
--retiring employees currently at PH and
--eligible for retirement package 
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
INNER JOIN departments AS d
ON (dm.dept_no = d.dept_no)
INNER JOIN current_emp AS ce
ON (dm.emp_no = ce.emp_no);

--Create list of Dept_info
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN department_employees AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

--Create Sales_info Table to query:
--employees about to retire in the sales department
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO sales_info
FROM current_emp as ce
INNER JOIN department_employees as de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments as d
ON(de.dept_no = d.dept_no)
WHERE (d.dept_name =('Sales'))

--Create Sales and Development table to query:
-- employees about to retire in the sales and development department
--using the IN statement
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO sales_development_info
FROM current_emp as ce
INNER JOIN department_employees as de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development');
	
--Deliverable #1a 
--Create Retirement_Titles table to query:
--employees eligible for retirement and their titles (includes titles over the years) 
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC; 

-- Deliverable #1b 
--Create Unique_Titles table to query:
--Employees Eligible for retirement and their current job titles
--use DISTINT ON to remove duplicate titles for single employee
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no ASC, rt.to_date DESC;

--Deliverable #1c 
--Create Retiring_titles table to query:
--number of employees about to retire by their most recent job title.
--use Count
SELECT COUNT (ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut 
GROUP BY ut.title
ORDER BY COUNT (ut.title) DESC;

-- Deliverable #2 
--Create Mentorship Eligibility table to query:
--current employees eligible for mentorship program
--eligibility based on birth year 1965
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN department_employees as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;

--Deliverable #3 Create additional tables for analysis

--Create "Total_Emp" table to query:
-- the total number of current employees at PH
SELECT COUNT(e.emp_no),
	de.to_date
INTO total_emp
FROM employees as e
LEFT JOIN department_employees as de
ON (e.emp_no = de.emp_no)
WHERE de.to_date = ('9999-01-01')
GROUP BY de.to_date;

--Create Total_retirement table to query:
--the total number of current employees at PH eligible 
--for retirement and retirement package
SELECT COUNT(ce.emp_no),
	de.to_date
INTO total_retirement
FROM current_emp as ce
INNER JOIN department_employees as de
ON (ce.emp_no = de.emp_no)
WHERE de.to_date = ('9999-01-01')
GROUP BY de.to_date;

---Create Retirment_Dept table to query:
-- number of employees about to retire in the each department
SELECT COUNT(ce.emp_no), d.dept_name
INTO retirement_dept
FROM current_emp as ce
INNER JOIN department_employees as de
ON ce.emp_no = de.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY d.dept_name;

--Create total_dept to query:
--total current employees in each department
SELECT COUNT(e.emp_no),
	d.dept_name
INTO total_dept
FROM employees as e
INNER JOIN department_employees as de
ON (e.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE de.to_date = ('9999-01-01')
GROUP BY d.dept_name
ORDER BY d.dept_name;

--Create Mentorship_title to query:
--number of employees eligible for the mentorship program by title
SELECT COUNT (me.title),
	me.title
INTO mentorship_title
FROM mentorship_eligibility as me
GROUP BY me.title
ORDER BY COUNT (me.title) DESC;







