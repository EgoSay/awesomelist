CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));

create view emp_v as select * from employees where emp_no >10005;

# 使用内连接获取emp_v和employees相同的数据
select emp_v.* from emp_v
inner join employees e on emp_v.emp_no = e.emp_no