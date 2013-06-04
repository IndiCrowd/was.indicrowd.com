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
import org.springframework.web.util.HtmlUtils;

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
	
	@Size(max = 10)
	@Column(length = 10, nullable = true)
	private String type;
	
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

	public boolean processMessageContent(Message message, boolean createBand) {
		String type = message.getType();
		
		if (!createBand && (type != null && type.length() > 0)) {
			return false;
		}
		
		String msg = HtmlUtils.htmlEscape(message.getContent());
		
		if (type != null && type.equals("notice")) {
			msg = String.format("<font style=\"font-weight:bold;color:#aa0000;\">%s</font>", msg);
		}	
		
		message.setContent(msg);
	
		return true;
	}
}
