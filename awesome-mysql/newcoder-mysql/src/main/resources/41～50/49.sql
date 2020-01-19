
# 针对库中的所有表生成select count(*)对应的SQL语句
SELECT 'select count(*) from '||name||';' AS cnts  FROM sqlite_master
WHERE type='table'