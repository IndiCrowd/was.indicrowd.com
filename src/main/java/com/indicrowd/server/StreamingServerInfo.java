package com.indicrowd.server;

import javax.persistence.Column;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class StreamingServerInfo {

	@Size(max = 50)
	@Column(length = 50, nullable = false)
	String name;
		
	@Size(max = 50)
	@Column(length = 50, nullable = false)
	String hostname;
	
	Long rtmpPort;
	
	Long httpPort;

	
}
