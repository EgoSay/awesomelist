# 汇总各个部门当前员工的title类型的分配数目，结果给出部门编号dept_no、dept_name、其当前员工所有的title以及该类型title对应的数目count
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
CREATE TABLE IF NOT EXISTS `titles` (
`emp_no` int(11) NOT NULL,
`title` varchar(50) NOT NULL,
`from_date` date NOT NULL,
`to_date` date DEFAULT NULL);

select dm_t.dept_no, departments.dept_name,dm_t.title, dm_t.count as count
from
(
    select dept_no, title, count(title) as count
    from dept_emp dm, titles t
    where dm.emp_no = t.emp_no
    and dm.to_date = '9999-01-01'
    and t.to_date = '9999-01-01'
    group by dm.dept_no, t.title
) dm_t
inner join departments
on dm_t.dept_no = departments.dept_no