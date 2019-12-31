CREATE PROCEDURE build_user_data(IN loop_times INT)
BEGIN
    DECLARE var INT DEFAULT 1;
    WHILE var < loop_times DO
            SET var = var + 1;
            INSERT INTO `test`.`user` ( `id`, `user_name`, `idcard`, `age`, `email` )
            VALUES( var, rand()*100000, '412702198502015021', rand()*50, 'test@qq.com' );
        END WHILE;
END


CALL build_user_data(200000)