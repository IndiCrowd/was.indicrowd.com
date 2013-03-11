package com.indicrowd.post;

import java.util.Calendar;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.band.BandInfo;
import com.indicrowd.user.model.UserInfo;
import com.indicrowd.util.DateUtil;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Post {
	Calendar date;
	
	@NotEmpty
	String title;

	@ManyToOne
	@JoinColumn(name = "bandId", nullable = false)
	BandInfo bandInfo;
	
	@ManyToOne
	@JoinColumn(name = "userId", nullable = true)
	UserInfo userInfo;
	
	@ManyToOne
	@JoinColumn(name = "writeBandId", nullable =true)
	BandInfo writeBandInfo;
	
	@Transient
	String author;
	
	@Transient
	String authorImageUrl;
	
	int commentCount;
	String summary;
	@Lob
	@Size
	@NotEmpty
	@Column
	String content;
	String type;
	String src;
	boolean hide;

	public int getDay(){
		return date.get(Calendar.DATE);
	}
	public int getYear(){
		return date.get(Calendar.YEAR);
	}
	public String getMonthString(){
		
		return DateUtil.getMonthString(date);
	}
	
	public static Post findPostWithAuthorInfo(long postId){
		Post post = findPost(postId);
		setAuthorInfo(post);
		return post;
	}
	
	public static void setAuthorInfo(Post post){
		if(post.writeBandInfo != null){
			post.setAuthor(post.writeBandInfo.getName());
			post.setAuthorImageUrl("/IndiCrowd/img/band/"+post.writeBandInfo.getImageFilePath());
		}else{
			post.setAuthor(post.userInfo.getNickname());
			post.setAuthorImageUrl(post.userInfo.getSocialImageUrl());
		}
	}
	
	
	public static List<Post> findPostsByBandId(Long bandId,int page,int postPerPage) {
		int startRecord = postPerPage * (page-1) ;
		int endRecord = postPerPage * page;
		return entityManager()
				.createQuery(
						"SELECT o FROM Post o WHERE o.hide != true AND o.bandInfo.id = :bandId ORDER BY id DESC LIMIT "+startRecord+","+endRecord,
						Post.class).setParameter("bandId", bandId)
				.getResultList();
	}
	
	public List<Comment> getCommentList() {
		long postId = getId();
		List<Comment> commentList = entityManager()
				.createQuery(
						"SELECT o FROM Comment o WHERE o.hide != true AND o.post.id = :postId ORDER BY id",
						Comment.class).setParameter("postId", postId)
				.getResultList();
		for(int i=0; i<commentList.size();i++){
			Comment.setAuthorInfo(commentList.get(i));
		}
		System.out.println(commentList);
		return commentList;
	}
	
	
}
