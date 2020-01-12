
CREATE TABLE IF NOT EXISTS film (
film_id smallint(5)  NOT NULL DEFAULT '0',
title varchar(255) NOT NULL,
description text,
PRIMARY KEY (film_id));

CREATE TABLE category  (
category_id  tinyint(3)  NOT NULL ,
name  varchar(25) NOT NULL, `last_update` timestamp,
PRIMARY KEY ( category_id ));

CREATE TABLE film_category  (
film_id  smallint(5)  NOT NULL,
category_id  tinyint(3)  NOT NULL, `last_update` timestamp);

# 使用子查询的方式找出属于Action分类的所有电影对应的title,description

SELECT
    f.title,
    f.description
FROM
    film f
        INNER JOIN film_category fc ON f.film_id = fc.film_id
WHERE
        fc.category_id IN ( SELECT category_id FROM category WHERE NAME = 'Action' );

# 直接关联查询
SELECT
    title,
    description
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE c.NAME = 'Action'



