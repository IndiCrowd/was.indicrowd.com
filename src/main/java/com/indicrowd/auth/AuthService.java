package com.indicrowd.auth;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.indicrowd.user.model.UserInfo;

@Service
public class AuthService {
	
	public void auth(UserInfo userInfo) {
		SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(userInfo, null, userInfo.getAuthorities()));
	}

	public UserInfo getUserInfo() {
		SecurityContext securityContext = SecurityContextHolder.getContext();
		if (securityContext == null) {
			return null;
		}
		Authentication authentication = securityContext.getAuthentication();
		if (authentication == null) {
			return null;
		}
		Object princiapl = authentication.getPrincipal();
		if (!(princiapl instanceof UserInfo)) {
			return null;
		}
		return (UserInfo) princiapl;
	}
	
	public void setUserInfo(UserInfo userInfo) {
		SecurityContext securityContext = SecurityContextHolder.getContext();
		if (securityContext == null) {
			return;
		}
		SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(userInfo, null, userInfo.getAuthorities()));
	}
	
	public Long getUserId() {
		UserInfo userInfo = getUserInfo();
		return userInfo == null ? null : userInfo.getId();
	}
	
	public String getUsername() {
		UserInfo userInfo = getUserInfo();
		return userInfo == null ? null : userInfo.getUsername();
	}

	public boolean isAnonymous() {
		return getUserInfo() == null;
	}

	public boolean isAuthenticated() {
		return getUserInfo() != null;
	}

}
