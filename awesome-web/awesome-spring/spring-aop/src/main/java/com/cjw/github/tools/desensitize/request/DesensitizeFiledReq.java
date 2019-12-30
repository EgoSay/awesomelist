package com.cjw.github.tools.desensitize.request;

import com.cjw.github.tools.desensitize.annotion.DesensitizeField;
import com.cjw.github.tools.desensitize.strategy.DesensitizeType;
import lombok.Data;

/**
 * @author Ego
 * @version 1.0
 * @date 2019/12/25 23:23
 * @since JDK1.8
 */
@Data
public class DesensitizeFiledReq {
    /**
     * 姓名
     */
    private String name;

    /**
     * 性别
     */
    private String sex;

    /**
     * 银行卡号
     */
    @DesensitizeField(DesensitizeType.DEFAULT)
    private String bankCardNo;

    /**
     * 身份证号
     */
    @DesensitizeField(DesensitizeType.ID_CARD)
    private String idCard;


}
