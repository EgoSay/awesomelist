package com.cjw.github.tools.desensitize.strategy;


import com.cjw.github.tools.desensitize.strategy.DesensitizeType;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 脱敏类型注册表
 * @author chenjiawei
 * @version 1.0
 * @date 2019/12/26 14:32
 * @since JDK1.8
 */
public class DesensitizeTypeRegisty {
    private static final Map<DesensitizeType, AbstractDesensitizeStrategy> HANDLER_REGISTY = new ConcurrentHashMap<>();

    static {
        HANDLER_REGISTY.put(DesensitizeType.NONE,new NoneDesensitizeStrategy());
        HANDLER_REGISTY.put(DesensitizeType.DEFAULT,new DefaultDesensitizeStrategy());
        HANDLER_REGISTY.put(DesensitizeType.ID_CARD,new IDCardDesensitizeStrategy());
        HANDLER_REGISTY.put(DesensitizeType.MOBILE_PHONE,new PhoneDesensitizeStrategy());
    }

    public static void put(AbstractDesensitizeStrategy sensitiveTypeHandler){
        HANDLER_REGISTY.put(sensitiveTypeHandler.getDesensitizeType(),sensitiveTypeHandler);
    }

    public static AbstractDesensitizeStrategy get(DesensitizeType sensitiveType){

        AbstractDesensitizeStrategy sensitiveTypeHandler =  HANDLER_REGISTY.get(sensitiveType);
        if(sensitiveTypeHandler==null){
            throw new IllegalArgumentException("none sensitiveTypeHandler be found!, type:"+sensitiveType.name());
        }
        return sensitiveTypeHandler;
    }

    /**
     * 是否已经是脱敏过的内容了
     * @param src 原始数据
     * @return 是否已经脱敏了
     */
    public static boolean alreadyBeSentisived(Object src){
        return src==null || src.toString().indexOf("*")>0;
    }
}
