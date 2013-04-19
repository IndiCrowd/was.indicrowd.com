package com.indicrowd.auth;

import org.springframework.security.core.Authentication;

import com.indicrowd.post.Comment;
import com.indicrowd.post.Post;
import com.indicrowd.user.model.UserInfo;

public class BandCommentPermission implements Permission {

	@Override
	public boolean isAllowed(Authentication authentication,
			Object targetDomainObject) {
		boolean hasPermission = false;
		
		if (isAuthenticated(authentication) && isCommentId(targetDomainObject)) {

			Comment comment = Comment.findComment((Long)targetDomainObject);
			
			if (comment != null) {
	            UserInfo userInfo = (UserInfo)authentication.getPrincipal();
	            
	            if (comment.getUserInfo().getId() == userInfo.getId()) {
	            	hasPermission = true;
	            }
	            else if (comment.getWriteBandInfo() != null && userInfo.isMemberOfBand(comment.getWriteBandInfo().getId())) {
	            	hasPermission = true;
	            }
			}
		}
		
		return hasPermission;
	}

	private boolean isCommentId(Object targetDomainObject) {
        return targetDomainObject instanceof Long;
    }

	
	private boolean isAuthenticated(Authentication authentication) {
        return authentication != null && authentication.getPrincipal() instanceof UserInfo;
    }
}
