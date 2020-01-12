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

# 使用join查询方式找出没有分类的电影id以及名称
SELECT
    film_id,
    title
FROM
    film
WHERE film_id NOT IN ( SELECT film_id FROM film_category WHERE category_id IS NOT NULL );

SELECT
    f.film_id,
    title
FROM
    film f
left join film_category fc on f.film_id = fc.film_id
where category_id is null;