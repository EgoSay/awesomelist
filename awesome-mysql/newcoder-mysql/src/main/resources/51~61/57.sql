# 使用含有关键字exists查找未分配具体部门的员工的所有信息
select * from employees
where not exists(SELECT emp_no
                 FROM dept_emp
                 WHERE emp_no = employees.emp_no)