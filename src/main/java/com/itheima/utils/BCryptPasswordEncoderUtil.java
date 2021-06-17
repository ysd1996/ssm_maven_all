package com.itheima.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptPasswordEncoderUtil {

    private static BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
    public static String encodPassword(String pwd){
        return bCryptPasswordEncoder.encode(pwd);
    }

    public static void main(String[] args) {
        System.out.println(encodPassword("123"));
    }
}
