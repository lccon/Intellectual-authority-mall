package com.mall.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Description:
 *
 * @Date:2020/1/8
 * @Author:lc
 */
public class DateUtil {

    private static final String date_format = "yyyy-MM-dd hh:mm:ss";

    /**
     * 将日期转为字符串类型
     * @param date
     * @return
     */
    public static String dateToString(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat(date_format);
        String format = sdf.format(date);
        return format;
    }

}
