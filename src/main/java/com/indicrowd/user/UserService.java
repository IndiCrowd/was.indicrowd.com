package com.indicrowd.user;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.indicrowd.user.model.UserInfo;

@Service
public class UserService implements UserDetailsService {

	@Override
	@Transactional
	public UserInfo loadUserByUsername(String username) {
		UserInfo userInfo = null;
		try {
			if (UserInfo.isUsernameExists(username, false)) {
				userInfo = UserInfo.findUserInfoByUsername(username);
				//if (userInfo != null) {
				//	userInfo.getAuths().iterator(); // Lazy 오류 문제를 해결하기 위한 코드
				//}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userInfo;
	}

}
