CREATE TABLE `dept_emp`
(`emp_no` int(11) NOT NULL,
 `dept_no` char(4) NOT NULL,
 `from_date` date NOT NULL,
 `to_date` date NOT NULL,
 PRIMARY KEY (`emp_no`,`dept_no`));

select dm.dept_no, dm.emp_no, max(s.salary)
from salaries as s, dept_emp as dm
where s.emp_no = dm.emp_no
and s.to_date='9999-01-01'
and dm.to_date='9999-01-01'
group by dm.dept_no