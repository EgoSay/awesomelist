CREATE TABLE `dept_emp`
(`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));

select de.emp_no as emp_no, dm.emp_no as manager_no
from dept_emp as de, dept_manager as dm
where de.dept_no = dm.dept_no
and de.emp_no != dm.emp_no
and de.to_date='9999-01-01'
and dm.to_date='9999-01-01'