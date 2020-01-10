# 对所有员工的当前(to_date='9999-01-01')薪水按照salary进行按照1-N的排名，相同salary并列且按照emp_no升序排列
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));


# 参考链接: https://blog.csdn.net/m0_37519490/article/details/81356902
# 牛课测试不通过，怀疑编译器问题
SELECT
    t.emp_no,
    t.salary,
    CASE
        WHEN @prevRank = salary THEN @curRank
        WHEN @prevRank := salary THEN @curRank := @curRank + 1
        END AS ranks # idea里直接写rank会报错
FROM
    ( SELECT s.emp_no, s.salary FROM salaries s WHERE to_date = '9999-01-01' GROUP BY emp_no ) t,
    ( SELECT @curRank := 0, @prevRank := NULL ) r
ORDER BY
    salary DESC,
    emp_no ASC;

# 参考其他人的答案， 可通过测试
SELECT s1.emp_no, s1.salary, COUNT(DISTINCT s2.salary) AS ranks
FROM salaries AS s1, salaries AS s2
WHERE s1.to_date = '9999-01-01'  AND s2.to_date = '9999-01-01' AND s1.salary <= s2.salary
GROUP BY s1.emp_no
ORDER BY s1.salary DESC, s1.emp_no ASC



