package com.indicrowd.post;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.user.model.UserInfo;
import com.indicrowd.util.DateUtil;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Comment {
	@ManyToOne
	@JoinColumn(name = "postId", nullable = false)
	Post post;
	
	@ManyToOne
	@JoinColumn(name = "userId", nullable =false)
	UserInfo userInfo;

	@Lob
	@Size
	@Column
	String content;
	
	Calendar date;
	
	boolean hide;
	
	public String getMonthString(){
		return DateUtil.getFormedDate(date);
	}
	
}
