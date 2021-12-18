package com.mit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "login"; 
	private static Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	private void saveDest(HttpServletRequest req) {
		
		String url = req.getRequestURI();
		String query = req.getQueryString(); 
		
		
		if(query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		
		
		if(req.getMethod().equals("GET")) { 
			logger.info("dest: " + (url + query)); 
			req.getSession().setAttribute("dest", url + query); 
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) == null) {
			logger.info("current user is not logined");
			
			saveDest(request);
			
			response.sendRedirect("/member/login");
			return false;
		} /*else {
			MemberVO checkAuth = (MemberVO) session.getAttribute(LOGIN);
			
			if (checkAuth.getMemberNo() == 12345678) { // ������
				logger.info("admin access...");
			} else { // ȸ��
				logger.info("user access...");
				
				// ���� ���� ���ƾ� �� ��� ���� Ȯ��
				saveDest(request);
				String dest = (String) session.getAttribute("dest");
				
				logger.info("�߸��� ����...");
				response.sendRedirect("/");
				
				if (dest.contains("admin")) { //��ο� admin�� ���ԵǸ� �����̷�Ʈ
					logger.info("�߸��� ����...");
					response.sendRedirect("/");
				}
			}
		}*/
		return true;
	}
}
