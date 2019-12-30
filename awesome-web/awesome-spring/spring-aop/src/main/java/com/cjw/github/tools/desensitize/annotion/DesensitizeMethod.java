package com.cjw.github.tools.desensitize.annotion;

import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;

import java.lang.annotation.*;

/**
 * @author Ego
 * @version 1.0
 * @date 2019/12/26 15:41
 * @since JDK1.8
 */
@Documented
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Order(Ordered.HIGHEST_PRECEDENCE)
public @interface DesensitizeMethod {
}
