package com.mall.properties;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Description:
 *
 * @Date:2019/12/16
 * @Author:lc
 */
public class GridProperties {

    private static Properties properties = new Properties();

    public static final Long SESSION_OUT_TIME = Long.valueOf(getProperties().getProperty("session.outTime"));

    public static final String MIAODI_URL = getProperties().getProperty("miaodi.url");

    public static final String ACCOUNT_SID = getProperties().getProperty("account.sid");

    public static final String AUTH_TOKEN = getProperties().getProperty("auth.token");

    private static Properties getProperties() {
        if (properties.size() == 0) {
            synchronized (properties) {
                InputStream resource = GridProperties.class.getClassLoader().getResourceAsStream("grid.properties");
                try {
                    properties.load(resource);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return properties;
    }

}
