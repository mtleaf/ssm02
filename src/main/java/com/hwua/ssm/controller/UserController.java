package com.hwua.ssm.controller;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hwua.ssm.entity.Auth;
import com.hwua.ssm.entity.User;
import com.hwua.ssm.service.RoleService;
import com.hwua.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/toMain")
    public String tomain(){
        return "user";
    }

    @RequestMapping(value = "/queryUser",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String queryUser(String userName,
                            String realName,
                            String valid,
                            Integer page,
                            Integer rows){
        Map<String,Object> param = new HashMap<>();
        param.put("userName", StringUtils.isEmpty(userName) ? null : userName);
        param.put("realName",StringUtils.isEmpty(realName) ? null : realName);
        param.put("valid",valid);
        param.put("start",(page - 1) * rows);
        param.put("rows",rows);
        Map<String, Object> map = userService.queryUser(param);
        System.out.println("map = " + map);
        return JSON.toJSONString(map);
    }
    @RequestMapping(value = "/queryValidRole",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String queryValidRole(Integer userId){
        List<Map<String, Object>> roles = userService.queryValidRole(userId);
        System.out.println("roles = " + roles);
        return JSON.toJSONString(roles);
    }
    @RequestMapping(value = "/grantRole",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String grantRole(Integer userId,Integer[] roleIds){
        System.out.println("userId = " + userId);
        System.out.println("roleIds = " + Arrays.toString(roleIds));
        int i = userService.grantRole(userId,roleIds);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg",i>0);
        return  jsonObject.toJSONString();
    }
    @RequestMapping(value = "/login",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String login(String  userName, String password, HttpSession session){
        password= DigestUtils.md5DigestAsHex(password.getBytes());
        User user = userService.login(userName, password);
        if(user!=null){
            session.setAttribute("user",user);
            List<Auth> auths = userService.getAuths(user.getDbid());
            session.setAttribute("auths",auths);
        }
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("msg",user!=null);
        return jsonObject.toJSONString();
    }
}