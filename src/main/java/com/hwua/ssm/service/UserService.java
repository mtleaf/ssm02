package com.hwua.ssm.service;

import com.hwua.ssm.entity.Auth;
import com.hwua.ssm.entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    public Map<String,Object> queryUser(Map<String,Object> params);
    public List<Map<String,Object>> queryValidRole(Integer userId);
    public int grantRole(Integer userId,Integer[] roleIds);
    public User login(String userName,String password);
    public List<Auth> getAuths(Integer userId);
}
