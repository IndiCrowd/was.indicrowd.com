package com.indicrowd.auth;

import java.util.ArrayList;
import java.util.Set;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.indicrowd.band.BandInfo;
import com.indicrowd.band.BandMember;
import com.indicrowd.concert.model.Concert;
import com.indicrowd.user.model.UserAuth;
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
		Object principal = authentication.getPrincipal();
		if (!(principal instanceof UserInfo)) {
			return null;
		}
		UserInfo userInfo = (UserInfo) principal;
		userInfo.setEnergy(UserInfo.findUserInfo(userInfo.getId()).getEnergy());
		userInfo.setUserBand(BandInfo.findBandInfoListByUserId(userInfo.getId()));
		Long adminCount = BandMember.getBandAdminCountByUser(userInfo.getId());
		if(adminCount>0){
			userInfo.setComingUpConcerts(Concert.findComingUpConcertList(userInfo.getId()));
		}else{
			if(userInfo.getComingUpConcerts() == null || userInfo.getComingUpConcerts().size() != 0){
				userInfo.setComingUpConcerts(new ArrayList<Concert>());
			}
		}
		
		return userInfo;
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
	
	public boolean checkRole(String role) {
		Set<UserAuth> auths = getUserInfo().getAuths();
		for (UserAuth auth : auths) {
			if (auth.getAuth().getAuthority().equals(role)) {
				return true;
			}
		}
		return false;
	}
	

	public boolean isAuthorizedUserOfBand(Long bandId) {
		if (!isAuthenticated())
			return false;
		
		UserInfo userInfo = getUserInfo();
		
		return userInfo.isMemberOfBand(bandId);
	}
	
	public boolean isAuthorizedUser(Long userId) {
		if (!isAuthenticated())
			return false;
		
		UserInfo userInfo = getUserInfo();
		
		if (!userInfo.getId().equals(userId))
			return false;
		
		return true;
	}
}
