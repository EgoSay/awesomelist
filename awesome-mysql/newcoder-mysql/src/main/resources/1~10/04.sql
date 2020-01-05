select last_name,first_name,d.dept_no
from employees as e,dept_manager as d
where e.emp_no = d.emp_no
  and d.dept_no is not null