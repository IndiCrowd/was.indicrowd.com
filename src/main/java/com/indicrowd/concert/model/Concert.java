package com.indicrowd.concert.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.band.BandInfo;
import com.indicrowd.util.DateUtil;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Concert {
	
	@NotEmpty
	@Size(max = 500)
	@Column(length = 500, nullable = false)
	private String title;
	
	@Lob
	@Size
	@Column
	String description;
	
	@ManyToOne
	@JoinColumn(name = "hallId", nullable = false)
	private Hall hall;
	
	@NotNull
	@Transient
	private Long hallId;
	
	@ManyToOne
	@JoinColumn(name = "bandId", nullable = false)
	private BandInfo bandInfo;
	
	@NotNull
	@Transient
	private Long bandId;
	
	
	@Column(nullable = false)
	private Integer startDate;
	
	@Column(nullable = false)
	private Integer startHours;
	
	@Column(nullable = false)
	private Integer startMinutes;
	
	
	@Column(nullable = false)
	private Integer duration;

	
	@Column(nullable = false)
	private int audienceLimit;
	
	@Column(nullable = true)
	private String youtubeLink;
	
	@Column(nullable = false)
	private boolean isValid = true;
	
	public static List<Concert> findConcertListByDateAndHall(Integer date,long hallId){
		return entityManager()
				.createQuery(
						"SELECT o FROM Concert o WHERE o.startDate  = :date AND o.hall.id = :hallId AND isValid=true",
						Concert.class).setParameter("hallId", hallId).setParameter("date", date)
				.getResultList();
	}
	
	public static List<Concert> findConcertListByDateRange(Integer startDate,Integer endDate){
		Integer startDateForQuery = DateUtil.calendarToInteger(DateUtil.getNextDay(DateUtil.getCalendarWithInteger(startDate), -2));
		Integer endDateForQuery = DateUtil.calendarToInteger(DateUtil.getNextDay(DateUtil.getCalendarWithInteger(endDate), 1));
		return entityManager()
				.createQuery(
						"SELECT o FROM Concert o WHERE (startDate > :startDate AND startHours > -1 AND startMinutes > -1) AND (startDate < :endDate ) AND isValid = true",
						Concert.class).setParameter("startDate", startDateForQuery).setParameter("endDate", endDateForQuery)
				.getResultList();
	}
}
