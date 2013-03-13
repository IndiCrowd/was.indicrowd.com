package com.indicrowd.concert.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.user.model.UserInfo;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class IconFeed {
	
	@ManyToOne
	@JoinColumn(name = "concertId", nullable = false)
	private Concert concert;
	
	@NotNull
	@Transient
	private Long concertId;

	@ManyToOne
	@JoinColumn(name = "senderId", nullable = false)
	private UserInfo sender;
	
	@NotEmpty
	@Column(nullable = false)
	private String iconName;
	
	@Column(nullable = false)
	private Date sendDate;

}
