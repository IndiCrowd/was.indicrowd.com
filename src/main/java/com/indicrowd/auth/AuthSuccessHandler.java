package com.indicrowd.auth;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.indicrowd.user.model.UserInfo;

public class AuthSuccessHandler extends
		SavedRequestAwareAuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		UserInfo userInfo = (UserInfo) authentication.getPrincipal();
		userInfo.increaseLoginCount();
		userInfo.setLastLoginDate(new Date());
		userInfo.merge();
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
}
