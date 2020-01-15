# 使用强制索引
# sqlLite 使用 indexed by 进行强制索引 SQLite Indexed By
# mysql 使用 force index 进行强制索引

SELECT * FROM salaries
INDEXED BY idx_emp_no
WHERE emp_no='10005';