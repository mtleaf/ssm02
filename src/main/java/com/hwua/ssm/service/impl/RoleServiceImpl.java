package com.hwua.ssm.service.impl;

import com.hwua.ssm.dao.AuthMapper;
import com.hwua.ssm.dao.RoleMapper;
import com.hwua.ssm.entity.Role;
import com.hwua.ssm.service.RoleService;
import jdk.internal.org.objectweb.asm.Handle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("RoleService")
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private AuthMapper authMapper;

    @Override
    public Map<String, Object> query(Map<String, Object> params) {
        HashMap<String, Object> map = new HashMap<>();
        List<Role> roles= roleMapper.query(params);
        int queryCount = roleMapper.queryCount(params);
        map.put("total",queryCount);
        map.put("rows",roles);
        return map;
    }

    @Override
    public List<Map<String, Object>> queryValidAuth(Integer roleId) {
        //查询有效的权限
        List<Map<String, Object>> validAuth = authMapper.queryValidAuth(-1);
        //查询角色对应的权限
        List<Integer> auths = authMapper.queryByRoleId(roleId);
        parseAuth(validAuth,auths);
        return validAuth;
    }
    //需要事务控制
    @Transactional
    @Override
    public int grantAuth(Integer roleId, Integer[] authIds) {
        int i=0;
        roleMapper.deleteByRoleId(roleId);
        List<Map<String,Integer>> param=new ArrayList<>();
        for (Integer authId:authIds) {
            Map<String ,Integer> map=new HashMap<>();
            map.put("roleId",roleId);
            map.put("authId",authId);
            param.add(map);
        }
        i+=roleMapper.insertAuth(param);
        return i;
    }

    /**
     * 递归设置checked属性
     * @param validAuth
     * @param auths
     */
    private void parseAuth(List<Map<String, Object>> validAuth,List<Integer> auths){
        for (Map<String, Object> auth : validAuth) {
            if(auths.contains(auth.get("id"))){
                auth.put("checked",true);
            }
            List<Map<String,Object>> children = (List<Map<String, Object>>) auth.get("children");
            parseAuth(children,auths);
        }
    }

}