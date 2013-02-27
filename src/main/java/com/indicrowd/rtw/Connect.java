package com.indicrowd.rtw;

import java.util.Date;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.user.model.UserInfo;

@RooJavaBean
@RooToString
public class Connect {

	private String connectId;
	
	private String namespace;
	
	private String id;

	private UserInfo userInfo;

	private int count;

	private Date connectDate;

}
