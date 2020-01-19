# 将employees表中的所有员工的last_name和first_name通过(')连接起来
SELECT last_name||"'"||first_name AS name
FROM employees