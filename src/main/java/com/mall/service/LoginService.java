package com.mall.service;

/**
 * Description:
 *
 * @Date:2019/12/11
 * @Author:lc
 */
public interface LoginService {

    /**
     * 登录情况判定
     * @param sessionId
     * @param accessIp
     * @param requestUrl
     * @return
     */
    Boolean isLogin(String sessionId, String accessIp, String requestUrl);

    /**
     * 登出
     * @param sessionId
     */
    void loginOut(String sessionId);
}
