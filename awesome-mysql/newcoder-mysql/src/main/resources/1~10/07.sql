# 应该考虑的问题：
# 需要利用分组函数GROUP BY对emp_no进行分组。
# 需要利用分组限定条件限定t值
select emp_no, count(*) as t
from salaries
group by emp_no
having t>15