# 最晚入职的当天未必就一个人，也许有多人，使用排序并限制得只能取得指定数量的结果，所以这里利用条件子查询
select * from employees where hire_date = (select max(hire_date) from employees)