package com.hwua.ssm.controller;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hwua.ssm.entity.Auth;
import com.hwua.ssm.entity.Role;
import com.hwua.ssm.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;
    @RequestMapping("/toMain")
    public String tomain(){
        return "role";
    }
    @RequestMapping(value = "/getAll",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String queryAll(String roleName,String roleCode,String  valid,Integer rows,Integer page){
        System.out.println("rloeName = " + roleName);
        System.out.println("roleCode = " + roleCode);
        System.out.println("valid = " + valid);
        System.out.println("rows = " + rows);
        HashMap<String, Object> map = new HashMap<>();
        map.put("roleName", StringUtils.isEmpty(roleName) ? null : roleName);
        map.put("roleCode",StringUtils.isEmpty(roleCode) ? null : roleCode);
        map.put("valid",valid);
        map.put("rows",rows);
        map.put("start",(page-1)*rows);
        Map<String, Object> query = roleService.query(map);
        System.out.println("query = " + query);
        return JSON.toJSONString(query);
    }
    @RequestMapping(value = "/getValidAuth",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String getValidAuth(Integer roleId){
        List<Map<String,Object>> auths = roleService.queryValidAuth(roleId);
        return JSON.toJSONString(auths);
    }
    @RequestMapping(value = "/grantAuth",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String grantAuth(Integer roleId,Integer[] authIds){
        System.out.println("roleId = " + roleId);
        System.out.println("authIds = " + Arrays.toString(authIds));
        int i = roleService.grantAuth(roleId, authIds);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg",i>0);
        return  jsonObject.toJSONString();
    }
}
