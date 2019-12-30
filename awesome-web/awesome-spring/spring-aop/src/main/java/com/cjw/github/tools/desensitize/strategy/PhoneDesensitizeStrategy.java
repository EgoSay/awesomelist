package com.cjw.github.tools.desensitize.strategy;


import com.cjw.github.tools.desensitize.strategy.AbstractDesensitizeStrategy;
import com.cjw.github.tools.desensitize.strategy.DesensitizeType;
import org.apache.commons.lang3.StringUtils;

/**
 * 电话号码脱敏策略
 *
 * @author chenjiawei
 * @version 1.0
 * @date 2019/12/26 14:42
 * @since JDK1.8
 */
public class PhoneDesensitizeStrategy implements AbstractDesensitizeStrategy {
    @Override
    public DesensitizeType getDesensitizeType() {
        return DesensitizeType.MOBILE_PHONE;
    }

    @Override
    public String handle(Object src) {
        if(src==null){
            return null;
        }
        String value = src.toString();
        return StringUtils.left(value, 3).concat(
                StringUtils.removeStart(StringUtils.leftPad(StringUtils.right(value, 4),
                        StringUtils.length(value), "*"),
                        "***"));
    }
}
