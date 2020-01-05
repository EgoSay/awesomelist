# 因为员工会有多次涨薪，所以salaries.emp_no 不唯一，这时我们就应该确定具体确定这个薪水的时间，也就是这个入职时间hire_date
select e.emp_no, s.salary
from employees as e, salaries as s
where e.emp_no = s.emp_no
and e.hire_date = s.from_date
order by e.emp_no desc ;