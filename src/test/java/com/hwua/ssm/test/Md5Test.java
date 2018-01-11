package com.hwua.ssm.test;

import org.junit.Test;
import org.springframework.util.DigestUtils;

public class Md5Test {
    @Test
    public void md5Test(){
        String s="sdfr";
        String s1 = DigestUtils.md5DigestAsHex(s.getBytes());
        System.out.println("s1 = " + s1);
    }
}
