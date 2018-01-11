package com.hwua.ssm.service;

import com.hwua.ssm.entity.Auth;

import java.util.List;

public interface AuthService {
    public List<Auth> queryByDbid(Integer dbid);
    public int doUpdateAuth(Auth auth);
    public int doInsertAuth(Auth auth);
}
