package com.indicrowd.shop;

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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.indicrowd.user.model.UserInfo;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Item {
	
	@ManyToOne
	@JoinColumn(name = "shopId")
	private Shop shop;

	@Transient
	private Long shopId;
	
	@NotEmpty
	@Size(max = 100)
	@Column(length = 100, nullable = false)
	private String name;
	
	@Size(max = 1000)
	@Column(length = 1000)
	private String description;
	
	@ManyToOne
	@JoinColumn(name = "creatorId", nullable = false)
	private UserInfo creator;

	@Column(nullable = false)
	private Date createDate;
	
	@Column(nullable = false)
	private int frameCount;
	
	@Column(nullable = false)
	private boolean isRepeat = false;
	
	@Column(nullable = false)
	private boolean isRewind = false;
	
	@Column(nullable = false)
	private boolean isBaseItem = false;
	
	@Transient
	private CommonsMultipartFile profilePhoto;
	
	@Transient
	private CommonsMultipartFile image;

}
