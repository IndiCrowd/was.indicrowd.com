package com.indicrowd.realtimeweb;

import java.util.Date;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
public class Connect {

	private String id;
	
	private int count;

	private Date connectDate;

}
