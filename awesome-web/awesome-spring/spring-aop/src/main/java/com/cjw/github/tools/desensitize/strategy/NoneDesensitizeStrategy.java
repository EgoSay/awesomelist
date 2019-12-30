package com.cjw.github.tools.desensitize.strategy;


import com.cjw.github.tools.desensitize.strategy.AbstractDesensitizeStrategy;
import com.cjw.github.tools.desensitize.strategy.DesensitizeType;

/**
 * 不脱敏
 * @author chenjiawei
 * @version 1.0
 * @date 2019/12/26 14:44
 * @since JDK1.8
 */
public class NoneDesensitizeStrategy implements AbstractDesensitizeStrategy {
    @Override
    public DesensitizeType getDesensitizeType() {
        return DesensitizeType.NONE;
    }

    @Override
    public String handle(Object src) {
        if (src != null) {
            return src.toString();
        }
        return null;
    }
}
