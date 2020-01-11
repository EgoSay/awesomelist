# 获取员工其当前的薪水比其manager当前薪水还高的相关信息，当前表示to_date='9999-01-01',
# 结果第一列给出员工的emp_no，
# 第二列给出其manager的manager_no，
# 第三列给出该员工当前的薪水emp_salary,
# 第四列给该员工对应的manager当前的薪水manager_salary
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));

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

# 1. 提取de.emp_no,de.dept_no,s.salary获得一个员工薪水表
# 2. 提取dm.emp_no,dm.dept_no,s.salary获得一个经理薪水表
# 3. 合并INNER JOIN获得一个目标薪水表
# 4. 选出员工薪水大于经理的列
select de_s.emp_no, dm_s.emp_no as manager_no, de_s.salary, dm_s.salary as manager_salary
from
(
    select de.emp_no, de.dept_no, s.salary
    from dept_emp as de, salaries as s
    where de.emp_no = s.emp_no
    and de.to_date = '9999-01-01'
    and s.to_date = '9999-01-01') de_s
inner join
(
    select dm.emp_no, dm.dept_no, s2.salary
    from dept_manager as dm, salaries as s2
    where dm.emp_no = s2.emp_no
    and dm.to_date = '9999-01-01'
    and s2.to_date = '9999-01-01'
)dm_s
on de_s.dept_no = dm_s.dept_no
and de_s.salary > dm_s.salary


