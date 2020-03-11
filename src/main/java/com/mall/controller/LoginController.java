package com.mall.controller;

import com.mall.component.ThreadVariable;
import com.mall.constant.PermissionConstant;
import com.mall.domain.Session;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.service.SessionService;
import com.mall.service.impl.UserServiceImpl;
import com.mall.utils.CookieUtil;
import com.mall.utils.IpAddressUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/api")
public class LoginController {
	@Autowired
	private UserServiceImpl userService;
	@Autowired
	private SessionService sessionService;

	@RequestMapping (value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Session login(HttpServletRequest request, HttpServletResponse response, String username, String password) {
		String sessionId = CookieUtil.getSessionId(request);
		CookieUtil.clearSessionsFromCookies(request, response);
		Session session = new Session();
		session.setAccessIp(IpAddressUtil.getIpAddr(request));
		session.setLastUrl(request.getRequestURI());
		session.setSessionId(sessionId);
		Session newSession = userService.getUserByUsernamePassword(username, password, session);
		if (!StringUtils.isEmpty(newSession.getSessionId())) {
			CookieUtil.putSessionIdInCookies(request, response, PermissionConstant.LOGIN_SESSION_ID,
					newSession.getSessionId());
		}
		return newSession;
	}

/*	@RequestMapping("/userMobileLogin")
	@ResponseBody
	public String userMobileLoginCheck(@RequestParam(value = "mobile") String mobile) {
		return userService.getUserMobileLoginCheckInfo(mobile);
	}*/
	@RequestMapping("/Aliyunmobile")
	@ResponseBody
	public String Aliyunmobile(@RequestParam(value = "mobile") String mobile) {
		return userService.Aliyunmobile(mobile);
	}
	@RequestMapping (value = "/logout", method = RequestMethod.POST)
	@ResponseBody
	public Boolean logout(String token, HttpServletRequest request, HttpServletResponse response) {
		CookieUtil.clearSessionsFromCookies(request, response);
		sessionService.deleteSessionBySessionId(token);
		ThreadVariable.setSession(null);
		return true;
	}
	
	@RequestMapping (value = "/now", method = RequestMethod.POST)
	@ResponseBody
	public User now(String token) {
		try {
			return userService.findUserBySessionId(token);
		} catch (BusinessValidationException e) {
			throw new BusinessValidationException(e.getMessage());
		} catch (Exception e) {
			throw new ServiceValidationException("通过令牌获取用户信息失败！", e);
		}
	}
	
	@RequestMapping (value = "/apply", method = RequestMethod.POST)
	@ResponseBody
	public Session apply(String token, String ussage) {
		Session session = ThreadVariable.getSession();
		if(session == null) {
			throw new BusinessValidationException("请重新登录!");
		}
		User user = userService.findUserById(session.getUserId());
		if (user == null) {
			throw new BusinessValidationException("用户不存在");
		}
		return session;
	}
	
}
