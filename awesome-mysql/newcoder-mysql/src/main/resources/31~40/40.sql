
CREATE TABLE IF NOT EXISTS actor (
actor_id smallint(5) NOT NULL PRIMARY KEY,
first_name varchar(45) NOT NULL,
last_name varchar(45) NOT NULL,
last_update timestamp NOT NULL );

# 修改表新增一列
alter table actor add column create_date datetime not null default '0000-00-00 00:00:00';