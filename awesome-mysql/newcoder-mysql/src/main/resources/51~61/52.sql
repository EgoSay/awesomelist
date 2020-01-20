# 获取Employees中的first_name，查询按照first_name最后两个字母，按照升序进行排列
select first_name
from employees
order by substr(first_name, length(first_name) - 1, 2)