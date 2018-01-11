package com.hwua.ssm.service.impl;

import com.hwua.ssm.dao.AuthMapper;
import com.hwua.ssm.dao.RoleMapper;
import com.hwua.ssm.dao.UserMapper;
import com.hwua.ssm.entity.Auth;
import com.hwua.ssm.entity.Role;
import com.hwua.ssm.entity.User;
import com.hwua.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service("UserService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private AuthMapper authMapper;
    @Override
    public Map<String, Object> queryUser(Map<String, Object> params) {
        HashMap<String, Object> map = new HashMap<>();
        List<User> users= userMapper.queryUser(params);
        int queryCount = userMapper.queryUserCount(params);
        map.put("total",queryCount);
        map.put("rows",users);
        return map;
    }

    @Override
    public List<Map<String, Object>> queryValidRole(Integer userId) {
        //查询出所有有效的角色
        List<Map<String, Object>> validRole = roleMapper.queryValidRole();
        //查询出用户对应的角色id
        List<Integer> roleIds = roleMapper.queryByUserId(userId);
        for (Map<String, Object> role : validRole) {
            if(roleIds.contains(role.get("dbid"))){
                role.put("checked",true);
            }
        }
        System.out.println("validRole = " + validRole);
        return validRole;
    }
    @Transactional
    @Override
    public int grantRole(Integer userId, Integer[] roleIds) {
        int i=0;
        userMapper.deleteByUserId(userId);
        List<Map<String,Integer>> param=new ArrayList<>();
        for (Integer roleId:roleIds) {
            Map<String ,Integer> map=new HashMap<>();
            map.put("roleId",roleId);
            map.put("userId",userId);
            param.add(map);
        }
        i+=userMapper.insertRole(param);
        return i;
    }

    @Override
    public User login(String userName, String password) {
        HashMap<String, String> param = new HashMap<>();
        param.put("userName",userName);
        param.put("password",password);
        User login = userMapper.login(param);
        return login;
    }

    @Override
    public List<Auth> getAuths(Integer userId) {
        List<Auth> auths = authMapper.queryByUserId(userId);
        Auth father=null;
        Auth son=null;
        List<Auth> children=null;
        for(int i=auths.size()-1;i>=0;i--){
            father=auths.get(i);
            children=new ArrayList<>();
            for(int j=auths.size()-1;j>=0;j--){
                son=auths.get(j);
                if(son.getParentId()==father.getDbid()){
                    children.add(son);
                    auths.remove(son);
                }
            }
            father.setChildren(children);
        }
        for(int i=0;i<auths.size();i++){
            Auth auth = auths.get(i);
            if(auth.getLayer()!=1){
                auths.remove(i);
                i--;
            }
        }
        return auths;
    }
}
