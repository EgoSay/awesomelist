package com.cjw.github.tools.desensitize.service.impl;

import com.cjw.github.tools.desensitize.annotion.DesensitizeMethod;
import com.cjw.github.tools.desensitize.request.DesensitizeFiledReq;
import com.cjw.github.tools.desensitize.service.DesensitizeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

/**
 * @author Ego
 * @version 1.0
 * @date 2019/12/26 11:05
 * @since JDK1.8
 */
@Service
@Slf4j
public class DesensitizeServiceImpl implements DesensitizeService {

    @Override
    @DesensitizeMethod
    public DesensitizeFiledReq testEncrypt(DesensitizeFiledReq request) {
        log.info("testEncrypt 业务逻辑入参 request:{}", request.toString());
        return null;
    }

    @Override
    @DesensitizeMethod
    public DesensitizeFiledReq testDecrypt(DesensitizeFiledReq request) {
        log.info("testDecrypt  业务逻辑入参 request:{}", request.toString());

        DesensitizeFiledReq response = new DesensitizeFiledReq();
        BeanUtils.copyProperties(request, response);
        return response;
    }
}
