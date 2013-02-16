package com.indicrowd.social;

import java.util.Properties;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository;
import org.springframework.social.connect.support.ConnectionFactoryRegistry;
import org.springframework.social.connect.web.ProviderSignInController;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.social.twitter.api.impl.TwitterTemplate;
import org.springframework.social.twitter.connect.TwitterConnectionFactory;

import com.indicrowd.auth.AuthService;
import com.indicrowd.user.model.UserInfo;

@Configuration
public class SocialConfig {
	
	@Autowired
	private Properties snsConfig;
	
	@Autowired
	private AuthService authService;

	@Bean
	public ConnectionFactoryLocator connectionFactoryLocator() {
		ConnectionFactoryRegistry registry = new ConnectionFactoryRegistry();
		
		registry.addConnectionFactory(new FacebookConnectionFactory(snsConfig
				.getProperty("facebook.appId"), snsConfig
				.getProperty("facebook.appSecret")));
		
		registry.addConnectionFactory(new TwitterConnectionFactory(snsConfig
				.getProperty("twitter.consumerKey"), snsConfig
				.getProperty("twitter.consumerSecret")));
		
		return registry;
	}

	@Bean
	public UsersConnectionRepository usersConnectionRepository() {
		JdbcUsersConnectionRepository repository = new JdbcUsersConnectionRepository(
				dataSource, connectionFactoryLocator(), Encryptors.noOpText());
		repository.setConnectionSignUp(new SocialConnectionSignUp());
		return repository;
	}

	@Inject
	private DataSource dataSource;
	
	@Bean
	@Scope(value="request", proxyMode=ScopedProxyMode.INTERFACES)	
	public ConnectionRepository connectionRepository() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null) {
			throw new IllegalStateException("Unable to get a ConnectionRepository: no user signed in");
		}
		if (authentication.getPrincipal() instanceof UserInfo) {
			UserInfo userInfo = (UserInfo) authentication.getPrincipal();
			return usersConnectionRepository().createConnectionRepository(userInfo.getId().toString());
		} else {
			return usersConnectionRepository().createConnectionRepository(authentication.getName());
		}
	}
	
	@Bean
	@Scope(value="request", proxyMode=ScopedProxyMode.INTERFACES)	
	public Facebook facebook() {
		Connection<Facebook> facebook = connectionRepository().findPrimaryConnection(Facebook.class);
		return facebook != null ? facebook.getApi() : new FacebookTemplate();
	}
	
	@Bean
	@Scope(value="request", proxyMode=ScopedProxyMode.INTERFACES)	
	public Twitter twitter() {
		Connection<Twitter> twitter = connectionRepository().findPrimaryConnection(Twitter.class);
		return twitter != null ? twitter.getApi() : new TwitterTemplate();
	}
	
	@Bean
	public ProviderSignInController providerSignInController(RequestCache requestCache) {
		return new SocialSignInController(connectionFactoryLocator(), usersConnectionRepository(), new SocialSignInAdapter(requestCache, authService));
	}

}
