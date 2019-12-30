package com.cjw.github.tools.desensitize.strategy;



/**
 * 脱敏策略抽象接口
 * @author chenjiawei
 * @version 1.0
 * @date 2019/12/26 14:27
 * @since JDK1.8
 */
public interface AbstractDesensitizeStrategy {

    /**
     * 获取脱敏的类型枚举
     * @return ;
     */
    DesensitizeType getDesensitizeType();
    /**
     * 对数据的值进行脱敏处理
     * @param src src
     * @return 脱敏后的数据
     */
    String handle(Object src);
}
