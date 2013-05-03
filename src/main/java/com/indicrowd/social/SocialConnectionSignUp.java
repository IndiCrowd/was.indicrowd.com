package com.indicrowd.social;

import java.util.Date;

import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionSignUp;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.social.twitter.api.TwitterProfile;

import com.indicrowd.user.model.UserInfo;

public final class SocialConnectionSignUp implements ConnectionSignUp {

	@Override
	public String execute(Connection<?> connection) {
		
		// 유저 정보를 생성하고 저장
		UserInfo userInfo = new UserInfo();
		
		if (connection.getApi() instanceof Facebook) {
			Facebook facebook = (Facebook) connection.getApi();
			FacebookProfile fp = facebook.userOperations().getUserProfile();
			
			userInfo.setNickname(fp.getName());
			userInfo.setEmail(fp.getEmail());
		}
		
		if (connection.getApi() instanceof Twitter) {
			Twitter twitter = (Twitter) connection.getApi();
			TwitterProfile tw = twitter.userOperations().getUserProfile();
			
			userInfo.setNickname(tw.getScreenName());
		}
		
		userInfo.setJoinDate(new Date());
		
		userInfo.setSocialUser(true);
		userInfo.setSocialDisplayName(connection.getDisplayName());
		userInfo.setSocialImageUrl(connection.getImageUrl());
		userInfo.setSocialProfileUrl(connection.getProfileUrl());
		userInfo.setSocialProviderId(connection.getKey().getProviderId());
		userInfo.setSocialProviderUserId(connection.getKey().getProviderUserId());
		
		userInfo.addAuth("ROLE_USER");
		userInfo.persist();
		
		return userInfo.getId().toString();
	}

}
