select distinct salary
from salaries
where to_date='9999-01-01'
order by salary desc

# 注：
# 大表一般用distinct效率不高，大数据量的时候都禁止用distinct，建议用group by解决重复问题。
# 在不同记录数较小时，count group by性能普遍高于count distinct，尤其对于text类型表现的更明显。
# 而对于不同记录数较大的场景，count group by性能反而低于直接count distinct（牛客网网友—啊啥水果的总结）