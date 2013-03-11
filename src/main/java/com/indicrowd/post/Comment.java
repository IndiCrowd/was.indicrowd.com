package com.indicrowd.post;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.band.BandInfo;
import com.indicrowd.user.model.UserInfo;
import com.indicrowd.util.DateUtil;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Comment {
	
	@ManyToOne
	@JoinColumn(name = "postId", nullable =false)
	Post post;
	
	@ManyToOne
	@JoinColumn(name = "userId", nullable =true)
	UserInfo userInfo;
	
	@ManyToOne
	@JoinColumn(name = "writeBandId", nullable =true)
	BandInfo writeBandInfo;

	@Lob
	@Size
	@Column
	String content;
	
	@Transient
	String author;
	
	@Transient
	String authorImageUrl;
	
	Calendar date;
	
	boolean hide;
	
	public static Comment findCommentWithAuthorInfo(long commentId){
		Comment comment= findComment(commentId);
		setAuthorInfo(comment);
		return comment;
	}
	
	public static void setAuthorInfo(Comment comment){
		if(comment.writeBandInfo != null){
			comment.setAuthor(comment.writeBandInfo.getName());
			comment.setAuthorImageUrl("/IndiCrowd/img/band/"+comment.writeBandInfo.getImageFilePath());
		}else{
			comment.setAuthor(comment.userInfo.getNickname());
			comment.setAuthorImageUrl(comment.userInfo.getSocialImageUrl());
		}
	}
	
	public String getMonthString(){
		return DateUtil.getFormedDate(date);
	}
	
}
