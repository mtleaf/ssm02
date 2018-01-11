package com.hwua.ssm.dao;

import com.hwua.ssm.entity.Role;

import java.util.List;
import java.util.Map;

public interface RoleMapper {
    public List<Role> query(Map<String,Object> param);
    public int queryCount(Map<String,Object> param);
    public int deleteByRoleId(Integer roleId);
    public int insertAuth(List<Map<String,Integer>> param);

    public List<Map<String,Object>> queryValidRole();
    public List<Integer> queryByUserId(Integer userId);

}
