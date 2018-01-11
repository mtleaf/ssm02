package com.hwua.ssm.dao;

import com.hwua.ssm.entity.Auth;

import java.util.List;
import java.util.Map;

public interface AuthMapper {
    public List<Auth> queryByDbid(Integer dbid);
    public int doUpdateAuth(Auth auth);
    public int doInsertAuth(Auth auth);
    public List<Map<String,Object>> queryValidAuth(Integer dbid);
    public List<Integer> queryByRoleId(Integer roleId);
    public List<Auth> queryByUserId(Integer userId);
}
