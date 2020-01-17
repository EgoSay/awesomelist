
# 将所有to_date为9999-01-01的全部更新为NULL,且 from_date更新为2001-01-01
update titles_test set from_date = '2001-01-01' , to_date = NULL
where to_date = '9999-01-01'