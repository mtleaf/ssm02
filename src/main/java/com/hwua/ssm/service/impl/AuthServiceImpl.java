package com.hwua.ssm.service.impl;

import com.hwua.ssm.dao.AuthMapper;
import com.hwua.ssm.entity.Auth;
import com.hwua.ssm.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("authService")
public class AuthServiceImpl implements AuthService {
    @Autowired
    private AuthMapper authMapper;
    @Override
    public List<Auth> queryByDbid(Integer dbid) {
        return authMapper.queryByDbid(dbid);
    }

    @Override
    public int doUpdateAuth(Auth auth) {
        return authMapper.doUpdateAuth(auth);
    }

    @Override
    public int doInsertAuth(Auth auth) {
        return authMapper.doInsertAuth(auth);
    }
}
