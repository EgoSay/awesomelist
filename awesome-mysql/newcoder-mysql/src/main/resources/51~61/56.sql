
# 获取所有员工的emp_no、部门编号dept_no以及对应的bonus类型btype和received ，没有分配具体的员工不显示
SELECT de.emp_no, de.dept_no, eb.btype, eb.recevied
FROM dept_emp AS de
LEFT JOIN emp_bonus AS eb
ON de.emp_no = eb.emp_no