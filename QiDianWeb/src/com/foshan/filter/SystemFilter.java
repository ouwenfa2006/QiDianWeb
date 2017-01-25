package com.foshan.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foshan.entity.User;

public class SystemFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request0=(HttpServletRequest) request;
		HttpServletResponse response0=(HttpServletResponse) response;
		String requestURI=request0.getRequestURI();
		/*检验用户是否已经登陆了*/
		/*if(!requestURI.endsWith("/loginController/login")){
			User user=(User) request0.getSession().getAttribute("session_user");
			if(user==null){
				response0.sendRedirect("/QiDianWeb/loginController/login");
				return;
			}
		}*/
		if(requestURI.endsWith("action")){
			User user=(User) request0.getSession().getAttribute("session_user");
			if(user==null){
				response0.sendRedirect("/QiDianWeb/loginController/login");
				return;
			}
		}

		chain.doFilter(request0, response0);

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
