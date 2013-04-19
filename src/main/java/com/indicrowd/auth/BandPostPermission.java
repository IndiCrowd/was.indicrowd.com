package com.indicrowd.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;

import com.indicrowd.post.Post;
import com.indicrowd.user.model.UserInfo;


public class BandPostPermission implements Permission {
	
	@Autowired
	AuthService authService;

	@Override
	public boolean isAllowed(Authentication authentication,
			Object targetDomainObject) {
		boolean hasPermission = false;
		Post post = null;
        if (isAuthenticated(authentication) && isPostId(targetDomainObject)) {
        	post = Post.findPost((Long)targetDomainObject);        
            
            if (post != null)
            {
	            UserInfo userInfo = (UserInfo)authentication.getPrincipal();
	            
	            if (post.getUserInfo().getId().equals(userInfo.getId())) {
	            	hasPermission = true;
	            }
	            else if (post.getWriteBandInfo() != null && userInfo.isMemberOfBand(post.getWriteBandInfo().getId())) {
	            	hasPermission = true;
	            }
	            else if (userInfo.isMemberOfBand(post.getBandInfo().getId())) {
	            	hasPermission = true;
	            }
            }
        }
        
        return hasPermission;
	}
	
	private boolean isPostId(Object targetDomainObject) {
        return targetDomainObject instanceof Long;
    }

	
	private boolean isAuthenticated(Authentication authentication) {
        return authentication != null && authentication.getPrincipal() instanceof UserInfo;
    }
}
