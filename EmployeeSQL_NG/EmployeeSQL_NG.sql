-- Drop table if exists
--drop table Department;
--drop table Dept_employee;
--drop table Dept_manager;
--drop table Employees;
--drop table Salaries;
--drop table Titles;

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/r41kXo
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
CREATE TABLE Titles (
    title_id Varchar(200)   NOT NULL,
    title Varchar(200)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

CREATE TABLE Department (
    dept_no Varchar(200)   NOT NULL,
    dept_name Varchar(200)   Not NULL,
    CONSTRAINT pk_Department PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Employees (
    emp_no int   NOT NULL,
    emp_title_id Varchar(200)   NOT NULL,
    birth_date date   NOT NULL,
    first_name Varchar(200)   NOT NULL,
    last_name Varchar(200)   NOT NULL,
    Sex Varchar(200)   NOT NULL,
    hire_date Date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Dept_employee (
    emp_no int   NOT NULL,
    dept_no Varchar(200)   NOT NULL,
    CONSTRAINT pk_Dept_employee PRIMARY KEY (
        emp_no, dept_no
     )
);

CREATE TABLE Dept_manager (
    dept_no Varchar(200)   NOT NULL,
    emp_no int   NOT NULL,
    CONSTRAINT pk_Dept_manager PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary money   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        emp_no
     )
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE Dept_employee ADD CONSTRAINT fk_Dept_employee_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_employee ADD CONSTRAINT fk_Dept_employee_dept_no FOREIGN KEY(dept_no)
REFERENCES Department (dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Department (dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);


-- View table columns and datatypes
select * from Employees;
select * from Department;
select * from Dept_employee;
select * from Dept_manager;
select * from Salaries;
select * from Titles;