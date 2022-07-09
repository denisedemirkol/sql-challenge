
CREATE TABLE Titles (
    titleID varchar(10)    NOT NULL,
    title   varchar(100)   NOT NULL,
    CONSTRAINT pk_Titles   PRIMARY KEY (titleID),
    CONSTRAINT uc_Titles_title UNIQUE (title)
);

CREATE TABLE Departments (
    Deptno varchar(100)     NOT NULL,
    DeptName varchar(150)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (Deptno),
    CONSTRAINT uc_Departments_DeptName UNIQUE (DeptName)
);

CREATE TABLE Employees (
    EmpNo       int             NOT NULL,
    Emp_Title   varchar(10)     NOT NULL,
    Birth_Date  varchar(15)     NOT NULL,
    First_Name  varchar(150)    NOT NULL,
    Last_Name   varchar(150)    NOT NULL,
    Sex         varchar(5)      NOT NULL,
    Hire_Date   varchar(15)     NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (EmpNo)
);

CREATE TABLE Salaries (
    EmpNo  int      NOT NULL,
    Salary money    NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (EmpNo)
);

CREATE TABLE Dept_Emp (
    EmpNo  int            NOT NULL,
    Deptno varchar(100)   NOT NULL,
    CONSTRAINT pk_Dept_Emp PRIMARY KEY (EmpNo,Deptno)
);

CREATE TABLE Dept_Manager (
    Deptno varchar(100)   NOT NULL,
    EmpNo  int            NOT NULL,
    CONSTRAINT pk_Dept_Manager PRIMARY KEY (Deptno,EmpNo )
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_Emp_Title FOREIGN KEY(Emp_Title)
REFERENCES Titles (titleID);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_EmpNo FOREIGN KEY(EmpNo)
REFERENCES Employees (EmpNo);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_Emp_No FOREIGN KEY(EmpNo)
REFERENCES Employees (EmpNo);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_Deptno FOREIGN KEY(Deptno)
REFERENCES Departments (Deptno);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Deptno FOREIGN KEY(Deptno)
REFERENCES Departments (Deptno);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Emp_No FOREIGN KEY(EmpNo)
REFERENCES Employees (EmpNo);

