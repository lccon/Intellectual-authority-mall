package com.mall.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.JsonObject;
import com.mall.component.ThreadVariable;
import com.mall.mapper.UserMapper;
import com.mall.domain.Session;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.properties.GridProperties;
import com.mall.redis.template.RedisTemplate;
import com.mall.service.SessionService;
import com.mall.service.UserService;
import com.mall.utils.HttpUtil;
import com.mall.utils.PasswordUtil;
import com.mall.utils.StringUtil;
import com.mall.vo.UserVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.net.URLEncoder;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

@Service("userService")
public class UserServiceImpl implements UserService {

	Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

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
			user.setPassword(PasswordUtil.getHashedPassword(user.getPassword()));
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
	public String getUserMobileLoginCheckInfo(String mobile) {
		try {
			String code = smsCode();
			StringBuilder sb = new StringBuilder();
			sb.append("accountSid=").append(GridProperties.ACCOUNT_SID);
			sb.append("&to=").append(mobile);
			sb.append("&smsContent=").append( URLEncoder.encode("【世通服务】亲爱的用户，您的短信验证码为" + code + "，,2分钟内有效，若非本人操作请忽略。","UTF-8"));
			String body = sb.toString() + HttpUtil.createCommonParam(GridProperties.ACCOUNT_SID, GridProperties.AUTH_TOKEN);
			String result = HttpUtil.post(GridProperties.MIAODI_URL, body);
			JSONObject jsonObject = JSONObject.parseObject(result);
			List list = JSONObject.parseArray(jsonObject.getString("failList"));
			if (list.size() > 0) {
				jsonObject.put("result", false);
			} else {
				jsonObject.put("result", true);
			}
			jsonObject.put("code", code);
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
