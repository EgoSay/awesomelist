# 统计各个部门的工资记录数，给出部门编码dept_no、部门名称dept_name以及次数sum
CREATE TABLE `departments` (
`dept_no` char(4) NOT NULL,
`dept_name` varchar(40) NOT NULL,
PRIMARY KEY (`dept_no`));
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));

SELECT dep.dept_no,dep.dept_name,COUNT(dep.dept_no)AS sum
FROM departments dep
INNER JOIN dept_emp dept ON dep.dept_no=dept.dept_no
INNER JOIN salaries s ON s.emp_no=dept.emp_no
GROUP BY dep.dept_no
