package com.mit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "login"; 
	private static Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();
		
	
		ModelMap modelMap = modelAndView.getModelMap();
		Object memberVO = modelMap.get("memberVO");
		
	
		if (memberVO != null) {
			
			logger.info("new login success");
			session.setAttribute(LOGIN, memberVO);
			
			
			Object dest = session.getAttribute("dest");
			response.sendRedirect(dest != null? (String)dest : "/"); 
		} else {
			
			//로그인 정보가 없는 경우
			response.sendRedirect("/member/login" + "?msg=not"); 
			
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	
		
	
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute(LOGIN) != null) {
			
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		return true;
	}
}
