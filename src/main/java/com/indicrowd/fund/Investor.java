package com.indicrowd.fund;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.user.model.UserInfo;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Investor {

	@ManyToOne
	@JoinColumn(name = "projectId", nullable = false)
	private Project project;

	@ManyToOne
	@JoinColumn(name = "rewardId")
	private Reward reward;

	@Transient
	private Long rewardId;
	
	@Column(nullable = false)
	private int amount;
	
	@ManyToOne
	@JoinColumn(name = "userId", nullable = false)
	private UserInfo userInfo;
	
	@Column(nullable = false)
	private Date investDate;

}
