package com.myncnc.ncnc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.myncnc.ncnc.helper.WebHelper;
import com.myncnc.ncnc.model.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	WebHelper webHelper;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception{
		webHelper.init(request, response);
		HttpSession session = request.getSession();
		Member login = (Member) session.getAttribute("member");
		
		
		
		if( login == null ) {
			throw new ModelAndViewDefiningException(webHelper.redirect("../login/login.do", "로그인 후 이용해주세요."));
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception{
		super.afterCompletion(request, response, handler, ex);
	}
}
