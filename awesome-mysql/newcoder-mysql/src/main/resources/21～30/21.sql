# 查找所有员工自入职以来的薪水涨幅情况，给出员工编号emp_no以及其对应的薪水涨幅growth，并按照growth进行升序
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));

CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));

# 入职工资不一定是最小的, 当前工资不一定是最大的
# select e.emp_no, max(s.salary) - min(s.salary) as growth
# from employees as e
# inner join salaries as s
# on e.emp_no = s.emp_no
# group by e.emp_no
# order by growth;

SELECT
    sCurrent.emp_no,
    ( sCurrent.salary - sStart.salary ) AS growth
FROM
    ( SELECT s.emp_no, s.salary FROM employees e LEFT JOIN salaries s ON e.emp_no = s.emp_no WHERE s.to_date = '9999-01-01' ) AS sCurrent
        INNER JOIN
    ( SELECT s.emp_no, s.salary FROM employees e LEFT JOIN salaries s ON e.emp_no = s.emp_no WHERE s.from_date = e.hire_date ) AS sStart
    ON sCurrent.emp_no = sStart.emp_no
ORDER BY growth;

# 解法二：利用case when
SELECT * from (
                  select c.emp_no,(c.cur_salary - c.hire_salary) as growth
                  from
                      (select a.emp_no,
                              sum(case when a.hire_date=b.from_date then salary end)as hire_salary,
                              sum(case when b.to_date='9999-01-01' then salary end) as cur_salary
                       from employees a
                                inner join salaries b
                                           on a .emp_no =b.emp_no
                       group by a.emp_no)c
                  order by growth) b
WHERE growth is not null
