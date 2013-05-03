package com.indicrowd.social;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.web.SignInAdapter;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.social.twitter.api.TwitterProfile;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.NativeWebRequest;

import com.indicrowd.auth.AuthService;
import com.indicrowd.user.model.UserInfo;

public class SocialSignInAdapter implements SignInAdapter {

	private RequestCache requestCache;
	
	private AuthService authService;

	@Inject
	public SocialSignInAdapter(RequestCache requestCache, AuthService authService) {
		this.requestCache = requestCache;
		this.authService = authService;
	}
	
	@Override
	@Transactional
	public String signIn(String userId, Connection<?> connection, NativeWebRequest request) {

		// 유저 정보 로드
		UserInfo userInfo = UserInfo.findUserInfo(Long.valueOf(userId));
		
		if (connection.getApi() instanceof Facebook) {
			Facebook facebook = (Facebook) connection.getApi();
			FacebookProfile fp = facebook.userOperations().getUserProfile();
			
			userInfo.setNickname(fp.getName());
			userInfo.setEmail(fp.getEmail());
		}
		
		if (connection.getApi() instanceof Twitter) {
			Twitter twitter = (Twitter) connection.getApi();
			TwitterProfile tw = twitter.userOperations().getUserProfile();
			
			userInfo.setNickname(tw.getName());
		}
		
		userInfo.setLastLoginDate(new Date());
		userInfo.increaseLoginCount();
		userInfo.merge();

		authService.auth(userInfo);
		return extractOriginalUrl(request);
	}

	private String extractOriginalUrl(NativeWebRequest request) {
		HttpServletRequest nativeReq = request.getNativeRequest(HttpServletRequest.class);
		HttpServletResponse nativeRes = request.getNativeResponse(HttpServletResponse.class);
		SavedRequest saved = requestCache.getRequest(nativeReq, nativeRes);
		if (saved == null) {
			return null;
		}
		requestCache.removeRequest(nativeReq, nativeRes);
		removeAutheticationAttributes(nativeReq.getSession(false));
		
		return saved.getRedirectUrl();
	}
		 
	private void removeAutheticationAttributes(HttpSession session) {
		if (session == null) {
			return;
		}
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}

}