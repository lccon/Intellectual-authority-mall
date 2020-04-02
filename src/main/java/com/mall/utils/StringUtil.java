package com.mall.utils;

import org.springframework.util.StringUtils;

/**
 * Description:
 *
 * @Date:2020/1/8
 * @Author:lc
 */
public class StringUtil {

    public static String joinSortFieldOrder(String filed,String sord){
        StringBuffer orderFiled = new StringBuffer();
        if(!StringUtils.isEmpty(filed)){
            orderFiled.append(filed);
            if(!StringUtils.isEmpty(sord)){
                orderFiled.append(" ").append(sord);
            }
        }
        return orderFiled.toString();
    }

}
