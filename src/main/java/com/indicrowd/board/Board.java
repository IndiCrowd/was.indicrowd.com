package com.indicrowd.board;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.user.model.UserInfo;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Board {

	@Size(max = 300)
	@Column(length = 300, nullable = false)
	private String name;

	@Size(max = 10000)
	@Column(length = 10000)
	private String content;

	@ManyToOne
	@JoinColumn(name = "creatorId", nullable = false)
	private UserInfo creator;
	
	@Column(nullable = false)
	private Date createDate;

	@Column
	private Date lastWriteDate;

	private int articleCount;

	public void increaseArticleCount() {
		articleCount++;
	}

	public void decreaseArticleCount() {
		articleCount--;
	}

	private boolean enabled = true;

}
