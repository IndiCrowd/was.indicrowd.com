package com.indicrowd.test;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;


@RooJavaBean
@RooToString
public class Item {
	String name;
	
	String imageLocation;
	
	String requestName;
}
