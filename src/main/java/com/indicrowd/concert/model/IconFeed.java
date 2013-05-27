package com.indicrowd.concert.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.shop.Item;
import com.indicrowd.user.model.UserInfo;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class IconFeed {
	
	@ManyToOne
	@JoinColumn(name = "concertId", nullable = false)
	private Concert concert;
	
	@ManyToOne
	@JoinColumn(name = "itemId", nullable = false)
	private Item item;

	@ManyToOne
	@JoinColumn(name = "senderId", nullable = false)
	private UserInfo sender;
	
	@Column(nullable = false)
	private Date sendDate;
	
	@Transient
	private String senderName;
	
	@Transient
	private long itemId;
	
	public static List<IconFeed> findIconFeedByConcertId(Long concertId) {
		List<IconFeed> list = entityManager().createQuery("SELECT o FROM IconFeed o WHERE o.concert.id = :concertId", IconFeed.class).setParameter("concertId", concertId).getResultList();
		return list;
	}

}
