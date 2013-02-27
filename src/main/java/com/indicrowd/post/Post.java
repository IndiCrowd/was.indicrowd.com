package com.indicrowd.post;

import java.text.DateFormatSymbols;
import java.util.Calendar;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.band.BandInfo;
import com.indicrowd.user.model.UserInfo;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Post {
	Calendar date;
	String title;

	@ManyToOne
	@JoinColumn(name = "bandId", nullable = false)
	BandInfo bandInfo;
	
	@ManyToOne
	@JoinColumn(name = "userId", nullable = false)
	UserInfo userInfo;
	String author;
	int commentCount;
	String summary;
	@Lob
	@Size
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
		
		return new DateFormatSymbols().getMonths()[date.get(Calendar.MONTH)];
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
}
