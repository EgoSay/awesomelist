select emp_no
from employees
where emp_no not in
(select emp_no from dept_manager)
