package com.mall.dao;

import com.mall.domain.Session;

/**
 * Description:
 *
 * @Date:2019/12/16
 * @Author:lc
 */
public interface SessionMapper {

    Session getSessionBySessionId(String sessionId);

    Integer deleteSessionBySessionId(String sessionId);

    void updateSessionBySessionId(Session session);

    void addSession(Session newSession);
}
