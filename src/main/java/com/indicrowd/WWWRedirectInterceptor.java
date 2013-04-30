package com.indicrowd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class WWWRedirectInterceptor extends HandlerInterceptorAdapter {

	@Value("#{wwwConfig.from}")
	private String from;

	@Value("#{wwwConfig.to}")
	private String to;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (request.getServerName().equals(from)) {
			response.sendRedirect(request.getScheme() + "://" + to + request.getRequestURL().substring(from.length() + request.getScheme().length() + 3));
			return false;
		}
		return true;
	}

}
