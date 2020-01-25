
# 获取有奖金的员工相关信息
SELECT em.emp_no, em.first_name, em.last_name, eb.btype, sal.salary,
(CASE eb.btype
 WHEN 1 THEN sal.salary * 0.1
 WHEN 2 THEN sal.salary * 0.2
 ELSE sal.salary * 0.3 END) AS bonus
FROM employees AS em INNER JOIN emp_bonus AS eb
ON em.emp_no = eb.emp_no
INNER JOIN salaries AS sal
ON em.emp_no = sal.emp_no
AND sal.to_date = '9999-01-01'