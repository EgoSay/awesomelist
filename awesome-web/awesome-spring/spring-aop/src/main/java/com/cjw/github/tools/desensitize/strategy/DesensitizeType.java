package com.cjw.github.tools.desensitize.strategy;

/**
 * 脱敏类型
 * @author chenjiawei
 * @version 1.0
 * @date 2019/12/26 14:29
 * @since JDK1.8
 */
public enum DesensitizeType {

    /**
     * 不脱敏
     */
    NONE,
    /**
     * 默认脱敏方式
     */
    DEFAULT,

    /**
     * 身份证号
     */
    ID_CARD,

    /**
     * 手机号
     */
    MOBILE_PHONE
}
