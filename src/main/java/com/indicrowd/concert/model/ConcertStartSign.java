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

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ConcertStartSign {
	@ManyToOne
	@JoinColumn(name = "concertId", nullable = false)
	private Concert concert;
	
	@Transient	
	private long concertId;
	@NotNull
	@Column(nullable = false)
	private Date startDate;
	
	private boolean youtubeAvailable = false;
	private String youtubeToken;
	
	public static List<ConcertStartSign> findConcertStartSignListByConcertId(long concertId){
		return entityManager()
				.createQuery(
						"SELECT o FROM ConcertStartSign o WHERE o.concert.id = :concertId" +
						" ORDER BY startDate",
						ConcertStartSign.class).setParameter("concertId", concertId)
				.getResultList();
	}
}
