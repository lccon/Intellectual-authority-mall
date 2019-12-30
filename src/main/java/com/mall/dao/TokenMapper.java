package com.mall.dao;

import com.mall.domain.Token;

public interface TokenMapper {

    int deleteTokenByUserId(Integer userId);

    int insert(Token record);

    Token getUserLoginToken(String token);

    int updateToken(Token record);
}