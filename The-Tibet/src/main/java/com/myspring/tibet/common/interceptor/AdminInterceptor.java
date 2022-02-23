package com.myspring.tibet.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.myspring.tibet.member.vo.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
  
		if(member == null || member.getAdminck() != 1) {
			res.sendRedirect("/");
			return false;
		}
		return true;
	}
}