package com.cjw.github.tools.desensitize.aspect;


import com.cjw.github.tools.desensitize.annotion.DesensitizeField;
import com.cjw.github.tools.desensitize.strategy.DesensitizeTypeRegisty;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.util.Objects;

/**
 * @author Ego
 * @version 1.0
 * @date 2019/12/26 16:40
 * @since JDK1.8
 */
@Component
@Aspect
@Slf4j
public class DesensitizeAspect {

    @Pointcut("@annotation(com.cjw.github.tools.desensitize.annotion.DesensitizeMethod)")
    public void annotationPointCut() {
    }

    @Around("annotationPointCut()")
    public Object around(ProceedingJoinPoint joinPoint) {
        log.info("进入数据脱敏处理流程.....");
        Object responseObj = null;
        try {
            Object requestObj = joinPoint.getArgs()[0];
            responseObj = handleParameters(requestObj);
        } catch (Throwable e) {
            e.printStackTrace();
            log.error("DesensitizeAspect处理出现异常{}", e.getMessage());
        }
        return responseObj;
    }

    /**
     *
     */
    private Object handleParameters(Object requestObj) throws IllegalAccessException {
        if (Objects.isNull(requestObj)) {
            return null;
        }
        Field[] fields = requestObj.getClass().getDeclaredFields();
        for (Field field : fields) {
            DesensitizeField desensitizeField = field.getAnnotation(DesensitizeField.class);
            if (desensitizeField != null) {
                field.setAccessible(true);
                Object value = field.get(requestObj);
                if (!DesensitizeTypeRegisty.alreadyBeSentisived(value)) {
                    String s = DesensitizeTypeRegisty.get(desensitizeField.value()).handle(value);
                    field.set(requestObj, s);
                }
            }
        }
        return requestObj;
    }
}
