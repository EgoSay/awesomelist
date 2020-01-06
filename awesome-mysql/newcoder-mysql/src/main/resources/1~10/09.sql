SELECT d.dept_no,d.emp_no,s.salary
FROM dept_manager d,salaries s
WHERE d.emp_no = s.emp_no
AND d.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'