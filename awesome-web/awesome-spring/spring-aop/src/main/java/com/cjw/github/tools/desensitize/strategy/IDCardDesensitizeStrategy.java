package com.cjw.github.tools.desensitize.strategy;

import com.cjw.github.tools.desensitize.strategy.AbstractDesensitizeStrategy;
import com.cjw.github.tools.desensitize.strategy.DesensitizeType;
import org.apache.commons.lang3.StringUtils;

/**
 * 身份证号脱敏策略
 * @author chenjiawei
 * @version 1.0
 * @date 2019/12/26 14:41
 * @since JDK1.8
 */
public class IDCardDesensitizeStrategy implements AbstractDesensitizeStrategy {
    @Override
    public DesensitizeType getDesensitizeType() {
        return DesensitizeType.ID_CARD;
    }

    @Override
    public String handle(Object src) {
        if(src==null){
            return null;
        }
        String idCard = src.toString();
        return StringUtils.left(idCard, 3).concat(
                StringUtils.removeStart(StringUtils.leftPad(StringUtils.right(idCard, 4),
                        StringUtils.length(idCard), "*"),
                        "***"));
    }
}
