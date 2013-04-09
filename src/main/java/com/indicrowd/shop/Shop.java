package com.indicrowd.shop;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.user.model.UserInfo;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Shop {
	
	@NotEmpty
	@Size(max = 100)
	@Column(length = 100, nullable = false)
	private String name;
	
	@ManyToOne
	@JoinColumn(name = "creatorId", nullable = false)
	private UserInfo creator;

	@Column(nullable = false)
	private Date createDate;
	
	@Column(nullable = false)
	private int itemCount;
	public void increaseItemCount() { itemCount++; };
	public void decreaseItemCount() { itemCount--; };

}
