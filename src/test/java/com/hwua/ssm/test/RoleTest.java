package com.hwua.ssm.test;

import com.hwua.ssm.dao.AuthMapper;
import com.hwua.ssm.dao.RoleMapper;
import com.hwua.ssm.entity.Role;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;

public class RoleTest {
    @Test
    public void test(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        RoleMapper bean = ctx.getBean(RoleMapper.class);
        HashMap<String, Object> map = new HashMap<>();
     //   map.put("roleName","管理员");
        //map.put("roleCode","admin");
       // map.put("valid","1");
        map.put("start",(1-1)*2);
        map.put("rows",2);
        List<Role> query = bean.query(map);
        System.out.println(query.size());
        System.out.println("query = " + query);
//        bean.query()
        //List<Auth> auths = bean.queryByDbid(-1);
        // System.out.println(JSON.toJSONString(auths));
    }
}
