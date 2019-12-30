package com.cjw.github.tools.desensitize.service;

import com.cjw.github.tools.desensitize.request.DesensitizeFiledReq;


/**
 * @author Ego
 * @version 1.0
 * @date 2019/12/26 10:33
 * @since JDK1.8
 */
public interface DesensitizeService {

    DesensitizeFiledReq testEncrypt(DesensitizeFiledReq request);


    DesensitizeFiledReq testDecrypt(DesensitizeFiledReq request);
}
