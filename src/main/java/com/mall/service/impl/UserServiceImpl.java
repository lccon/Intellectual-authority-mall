package com.mall.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.component.ThreadVariable;
import com.mall.mapper.UserMapper;
import com.mall.domain.Session;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.redis.template.RedisTemplate;
import com.mall.service.SessionService;
import com.mall.service.UserService;
import com.mall.utils.HttpUtils;
import com.mall.utils.PasswordUtil;
import com.mall.utils.StringUtil;
import com.mall.vo.UserVO;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import java.util.*;

@Service("userService")
public class UserServiceImpl implements UserService {

	Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	private static final Integer MANAGER = 2;

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private SessionService sessionService;
	@Autowired
	private RedisTemplate redisTemplate;

	@Override
	public User findUserById(Long id) {
		if (id == null) {
			throw new BusinessValidationException("用户信息不能为空!");
		}
		try {
			return userMapper.selectByPrimaryKey(id);
		} catch (Exception e) {
			throw new ServiceValidationException("查询用户出错!", e);
		}
	}

	@Override
	public User addUser(User user) {
		if (user == null) {
			throw new BusinessValidationException("用户信息不能为空！");
		}
		try {
			user.setPassword(PasswordUtil.getHashedPassword(user.getPassword()));
			userMapper.addUser(user);
			return user;
		} catch (Exception e) {
			throw new ServiceValidationException("新增用户出错！", e);
		}
	}
	
	@Override
	public User updateUser(User user) {
		if (user == null) {
			throw new BusinessValidationException("用户不存在！");
		}
        try {
			userMapper.updateByPrimaryKeySelective(user);
			return user;
		} catch (Exception e) {
			throw new ServiceValidationException("修改用户信息失败", e);
		}
	}

	@Override
	public Session getUserByUsernamePassword(String username, String password, Session session) {
		if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
			throw new BusinessValidationException("用户名或密码不能为空！");
		}
		password = PasswordUtil.getHashedPassword(password);
		User user = userMapper.getUserByUsernamePassword(username, password);
		logger.error("用户信息[{}]", user);
		if (user == null) {
			throw new BusinessValidationException("用户名或密码错误！");
		}
        if(user.getIdentity() == null || !MANAGER.equals(user.getIdentity())) {
            throw new BusinessValidationException("请使用管理员账号进行登录");
        }
		try {
			// 删除登录过的session
			sessionService.deleteSessionBySessionId(session.getSessionId());
			Session newSession = proccessLoginSuccess(user, session);
			return newSession;
		} catch (Exception e) {
			throw new ServiceValidationException("获取令牌认证失败！", e);
		}
	}

	@Override
	public Session getUserByMobilePassword(String mobile, String password, Session session) {
		if(StringUtils.isEmpty(mobile) || StringUtils.isEmpty(password)) {
			throw new BusinessValidationException("手机号或密码不能为空！");
		}
		password = PasswordUtil.getHashedPassword(password);
		User user = userMapper.getUserByMobilePassword(mobile, password);
		logger.error("用户信息[{}]", user);
		if (user == null) {
			throw new BusinessValidationException("手机号或密码错误！");
		}
		try {
			// 删除登录过的session
			sessionService.deleteSessionBySessionId(session.getSessionId());
			Session newSession = proccessLoginSuccess(user, session);
			return newSession;
		} catch (Exception e) {
			throw new ServiceValidationException("获取令牌认证失败！", e);
		}
	}

	@Override
	public User updatePassword(User user) {
		if (user == null || StringUtils.isEmpty(user.getMobile()) || StringUtils.isEmpty(user.getPassword())) {
			throw new BusinessValidationException("参数不能为空!");
		}
		try {
			user.setPassword(PasswordUtil.getHashedPassword(user.getPassword()));
			userMapper.updatePassword(user);
			return user;
		} catch (Exception e) {
			throw new ServiceValidationException("修改用户密码出错!", e);
		}
	}


	@Override
	public Boolean getUserByMobile(String mobile) {
		User user=userMapper.getUserByMobile(mobile);
		if(user!=null){
		    return false;
        }else{
		    return true;
        }
	}

	@Override
	public Boolean validateMobile(Long id, String mobile) {
		if (StringUtils.isEmpty(mobile)) {
			throw new BusinessValidationException("手机号不能为空!");
		}
		try {
			User user = userMapper.validateMobile(id, mobile);
			if (user != null) {
				return false;
			}
			return true;
		} catch (Exception e) {
			throw new ServiceValidationException("手机号验证失败", e);
		}
	}

	@Override
	public User findUserBySessionId(String sessionId) {
		if (StringUtils.isEmpty(sessionId)) {
			return new User();
		}
		Session session = sessionService.getSessionBySessionId(sessionId);
		if(session == null) {
			return new User();
		}
		User user = findUserById(session.getUserId());
		user.setPassword(null);
		return user;
	}

	@Override
	public PageInfo<User> findUserForPage(UserVO userVO) {
		try {
			PageHelper.startPage(userVO.getPage(), userVO.getRows(),
					StringUtil.joinSortFieldOrder(userVO.getSidx(), userVO.getSord()));
			List<User> userList = userMapper.findUserForList(userVO);
			return new PageInfo<>(userList);
		} catch (Exception e) {
			throw new ServiceValidationException("分页查询用户信息出错!", e);
		}
	}

	@Override
	public Boolean deleteUser(Long[] ids) {
		if (ids == null || ids.length <= 0) {
			throw new BusinessValidationException("参数不能为空!");
		}
		try {
			Integer count = userMapper.deleteUser(ids);
			return count > 0;
		} catch (Exception e) {
			throw new ServiceValidationException("删除数据失败!", e);
		}
	}

	@Override
	public String Aliyunmobile(String mobile) {
		try {
			String host = "https://feginesms.market.alicloudapi.com";
			String path = "/codeNotice";
			String method = "GET";
			String appcode = "09dc266f587846e582668ef9215093f7";
			Map<String, String> headers = new HashMap<String, String>();
			headers.put("Authorization", "APPCODE " + appcode);
			Map<String, String> querys = new HashMap<String, String>();
			String code=smsCode();
			querys.put("param",code);
			querys.put("phone", mobile);
			querys.put("sign", "500420");
			querys.put("skin", "900620");
			HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
			JSONObject jsonObject=JSONObject.parseObject(EntityUtils.toString(response.getEntity()));
			jsonObject.put("code",code);
			return jsonObject.toString();
		} catch (Exception e) {
			throw new ServiceValidationException("用户手机号登录校验失败！", e);
		}
	}

	private Session proccessLoginSuccess(User user, Session session) {
		String sid = UUID.randomUUID().toString();
		Session newSession = new Session();
		newSession.setLoginIp(session.getAccessIp());
		newSession.setUserName(user.getUsername());
		newSession.setAccessTime(Calendar.getInstance().getTime());
		newSession.setSessionId(sid);
		newSession.setIsLogin(true);
		newSession.setLastUrl(session.getLastUrl());
		newSession.setAccessIp(session.getSessionId());
		newSession.setUserId(user.getId());
		newSession.setMobile(user.getMobile());
		newSession.setFreeMessageNum(user.getFreeMessageNum());
		newSession.setHeadPortrait(user.getHeadPortrait());
		newSession.setAuthorizeType(user.getAuthorizeType());
		logger.error("session信息[{}]", newSession);
		newSession = sessionService.addSession(newSession);
		ThreadVariable.setSession(newSession);
		redisTemplate.set(newSession.getSessionId(), newSession);
		return newSession;
	}

	private String smsCode() {
		String random = (int) ((Math.random() * 9 + 1) * 100000) + "";
		return random;
	}

}
