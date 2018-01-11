package com.hwua.ssm.service;

import com.hwua.ssm.entity.Auth;
import com.hwua.ssm.entity.Role;

import java.util.List;
import java.util.Map;

public interface RoleService {
    public Map<String,Object> query(Map<String,Object> params);
    public List<Map<String,Object>> queryValidAuth(Integer roleId);
    public int grantAuth(Integer roleId,Integer[] authIds);
}
