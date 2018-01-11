package com.hwua.ssm.test;

import com.alibaba.fastjson.JSON;
import com.hwua.ssm.dao.AuthMapper;
import com.hwua.ssm.entity.Auth;
import com.hwua.ssm.service.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class AuthTest {
    @Test
    public void test(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        AuthMapper bean = ctx.getBean(AuthMapper.class);
        //List<Auth> auths = bean.queryByDbid(-1);
       // System.out.println(JSON.toJSONString(auths));
    }
    @Test
    public void testQ(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService bean = ctx.getBean(UserService.class);
        List<Auth> auths = bean.getAuths(29);
        System.out.println( JSON.toJSONString(auths));
        //List<Auth> auths = bean.queryByDbid(-1);
        // System.out.println(JSON.toJSONString(auths));
    }

}
