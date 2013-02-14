package com.indicrowd.concert.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.user.model.UserInfo;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Message {
	
	@ManyToOne
	@JoinColumn(name = "concertId", nullable = false)
	private Concert concert;
	
	@Transient
	private Long concertId;

	@ManyToOne
	@JoinColumn(name = "senderId", nullable = false)
	private UserInfo sender;

	@NotEmpty
	@Size(max = 1000)
	@Column(length = 1000, nullable = false)
	private String content;
	
	@Column(nullable = false)
	private Date sendDate;

}
