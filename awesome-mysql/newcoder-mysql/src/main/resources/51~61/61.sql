# 对于employees表中，给出奇数行的first_name
SELECT e1.first_name FROM
employees e1
WHERE
(SELECT count(*) FROM employees e2
WHERE e1.first_name <=e2.first_name)%2=1;