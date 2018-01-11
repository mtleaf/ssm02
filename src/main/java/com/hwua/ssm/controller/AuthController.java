package com.hwua.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hwua.ssm.dao.AuthMapper;
import com.hwua.ssm.entity.Auth;
import com.hwua.ssm.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private AuthService authService;
    @RequestMapping(value = "/toMain")
    public String  main(){
        return "auth";
    }
/*    @RequestMapping(value = "/toMain")
    public String testMap(Map<String,Object> map){

        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        AuthMapper bean = ctx.getBean(AuthMapper.class);
        List<Auth> auths = authService.queryByDbid(-1);
        String json = JSON.toJSONString(auths);
        map.put("json",json);
        return "auth";
    }*/
@RequestMapping(value = "/getAll",produces = "application/json;charset=UTF-8")
@ResponseBody
public String queryAll(){
        List<Auth> auths = authService.queryByDbid(-1);
        return JSON.toJSONString(auths);
    }

    @RequestMapping(value = "/update",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String testMap(Auth auth){

       /* ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        AuthMapper bean = ctx.getBean(AuthMapper.class);*/
       if(auth.getDbid()>0){
           System.out.println("auth = " + auth.getDbid());
           int i = authService.doUpdateAuth(auth);
           JSONObject jsonObject = new JSONObject();
           if(i==1){
               jsonObject.put("msg",true);
           }else{
               jsonObject.put("msg",false);
           }
           return jsonObject.toJSONString();
       }else{
           int j = authService.doInsertAuth(auth);
           System.out.println("auth = " + auth.getDbid());
           JSONObject jsonObject1 = new JSONObject();
           if(j==1){
               jsonObject1.put("msg",true);
           }else{
               jsonObject1.put("msg",false);
           }
           return jsonObject1.toJSONString();
       }

    }
}
