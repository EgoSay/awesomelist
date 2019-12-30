package com.cjw.github.spring;

import com.cjw.github.tools.desensitize.DesensitizeApplication;
import com.cjw.github.tools.desensitize.request.DesensitizeFiledReq;
import com.cjw.github.tools.desensitize.service.DesensitizeService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest(classes = DesensitizeApplication.class)
class DesensitizeApplicationTests {

    @Test
    void contextLoads() {
    }

    @Resource
    DesensitizeService desensitizeService;

    @Test
    public void testEncrypt() {
        DesensitizeFiledReq desensitizeFiledReq = new DesensitizeFiledReq();
        desensitizeFiledReq.setBankCardNo("412702199002091212");
        desensitizeFiledReq.setIdCard("412702199002091212");
        desensitizeFiledReq.setName("张三1");
        desensitizeFiledReq.setSex("男");

        desensitizeService.testEncrypt(desensitizeFiledReq);
    }

    @Test
    public void testDecrypt() {
        DesensitizeFiledReq desensitizeFiledReq = new DesensitizeFiledReq();
        desensitizeFiledReq.setBankCardNo("412702199002091212");
        desensitizeFiledReq.setIdCard("412702199002091212");
        desensitizeFiledReq.setName("张三1");
        desensitizeFiledReq.setSex("男");

        DesensitizeFiledReq decrypt = desensitizeService.testDecrypt(desensitizeFiledReq);
        log.info("解密:{}", decrypt.toString());
    }

}
