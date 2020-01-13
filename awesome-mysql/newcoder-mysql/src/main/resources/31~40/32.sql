# 将employees表的所有员工的last_name和first_name拼接起来作为Name，中间以一个空格区分
CREATE TABLE `employees` ( `emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));

# 牛课网评测不是SQL lite， 不支持 concat
select concat(last_name, ' ', first_name) as Name
from employees;

SELECT last_name||' '||first_name AS Name
FROM employees
