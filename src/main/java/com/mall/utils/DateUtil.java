package com.mall.utils;

import java.text.SimpleDateFormat;
import java.util.*;

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

    public static Date getLastPeriodDay(Integer day) {
        Date date=new Date();//取时间
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        calendar.add(calendar.DATE,-day);//把日期往前减少一天，若想把日期向后推一天则将负数改为正数
        date=calendar.getTime();
        return date;
    }

}
