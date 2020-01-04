# 查找各个部门当前(to_date='9999-01-01')领导当前薪水详情以及其对应部门编号dept_no
CREATE TABLE `dept_manager` (
                                `dept_no` char(4) NOT NULL,
                                `emp_no` int(11) NOT NULL,
                                `from_date` date NOT NULL,
                                `to_date` date NOT NULL,
                                PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `salaries` (
                            `emp_no` int(11) NOT NULL,
                            `salary` int(11) NOT NULL,
                            `from_date` date NOT NULL,
                            `to_date` date NOT NULL,
                            PRIMARY KEY (`emp_no`,`from_date`));



SELECT s.*,d.dept_no FROM salaries AS s,dept_manager AS d
WHERE s.emp_no = d.emp_no
  AND s.to_date='9999-01-01'
  AND d.to_date='9999-01-01'