package com.mall.service;

import com.mall.domain.Token;

public interface TokenService {
	Token findToken(String token);
	
	void addToken(Token token);
	
	void updateToken(Token token);
	
	void deleteTokens(Integer userId);
}
