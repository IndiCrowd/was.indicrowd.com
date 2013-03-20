package com.indicrowd.concert.model;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.user.model.UserInfo;


@RooJavaBean
@RooToString
public class UserState {
	
	private Long userID;
	
	private Boolean cameraState;

	public void setUserID(Long userID)
	{
		this.userID = userID;
	}
	
	public void setCameraState(Boolean cameraState) {
		this.cameraState = cameraState;
	}
}
