package com.hwua.ssm.dao;

import com.hwua.ssm.entity.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    public List<User> queryUser(Map<String,Object> param);
    public int queryUserCount(Map<String,Object> param);
    public User login(Map<String ,String> param);
    public int deleteByUserId(Integer userId);
    public int insertRole(List<Map<String,Integer>> param);
}
