# 创建一个actor_name表，将actor表中的所有first_name以及last_name导入改表
create table actor_name as
select first_name,last_name from actor;