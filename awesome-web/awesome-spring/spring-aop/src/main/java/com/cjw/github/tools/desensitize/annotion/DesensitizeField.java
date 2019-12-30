package com.cjw.github.tools.desensitize.annotion;


import com.cjw.github.tools.desensitize.strategy.DesensitizeType;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;

import java.lang.annotation.*;

/**
 * @author Ego
 * @version 1.0
 * @date 2019/12/26 15:40
 * @since JDK1.8
 */
@Documented
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Order(Ordered.HIGHEST_PRECEDENCE)
public @interface DesensitizeField {
    /**
     * 脱敏类型
     * 不同的脱敏类型置换*的方式不同
     * @return SensitiveType
     */
    DesensitizeType value();
}
