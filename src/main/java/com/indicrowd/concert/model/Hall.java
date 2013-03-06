package com.indicrowd.concert.model;

import java.util.Date;

import javax.persistence.Column;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Hall {
	
	@NotEmpty
	@Size(max = 200)
	@Column(length = 200, nullable = false)
	private String name;
	
	@Column(nullable = false)
	private Date createDate;

}
