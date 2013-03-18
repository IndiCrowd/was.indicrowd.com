package com.indicrowd.band;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class BandRoleType {
	
	public static final long BAND_ADMIN = 1;
	public static final long BAND_MEMBER = 2;
	
	Long root_type_id; // recursive
	String name;
	int priority;
}
