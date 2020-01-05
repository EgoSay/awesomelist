
# 应该考虑的问题：
# ①没有具体分配的员工也要展示，也就是要保证employees表的完整
# ②内连接已经不能满足需求，需要用左连接或者又连接

select last_name,first_name,d.dept_no
from employees as e
left join dept_manager as d
on e.emp_no = d.emp_no

# 注：
# 内连接（INNER JOIN）两边表任何一边缺失都不显示。
# 左连接（LEFT JOIN)，右边表可以无对应数据。
# 右连接（RIGHT JOIN），左边表可以无对应数据。