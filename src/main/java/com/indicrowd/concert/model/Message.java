package com.indicrowd.concert.model;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
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
	
	@NotNull
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
	
	@Transient
	private String senderName;
	
	public static List<Message> findMessageEntriesByConcertId(Long concertId, int firstResult, int maxResults) {
		List<Message> list = entityManager().createQuery("SELECT o FROM Message o WHERE o.concert.id = :concertId ORDER BY o.id DESC", Message.class).setParameter("concertId", concertId).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
		Collections.reverse(list);
		return list;
	}

	public static Long countMessageByConcertId(Long concertId) {
		return entityManager().createQuery("SELECT COUNT(o) FROM Message o WHERE o.concert.id = :concertId", Long.class).setParameter("concertId", concertId).getSingleResult();
	}
	
	public static List<Message> findMessageByConcertId(Long concertId) {
		List<Message> list = entityManager().createQuery("SELECT o FROM Message o WHERE o.concert.id = :concertId", Message.class).setParameter("concertId", concertId).getResultList();
		return list;
	}

}
