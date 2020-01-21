# 分页查询employees表，每5行一页，返回第2页的数据
# select * from table limit m,n
# 其中m是指记录开始的index，从0开始，表示第一条记录
# n是指从第m+1条开始，取n条
select * from employees limit 5,5