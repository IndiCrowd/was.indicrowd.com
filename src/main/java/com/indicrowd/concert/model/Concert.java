package com.indicrowd.concert.model;

import java.util.Calendar;
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
import com.indicrowd.band.BandRoleType;
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
	
	@Transient
	private boolean startEvent;
	
	@Transient
	private boolean endEvent;
	
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
	
	public static final int START_BEFORE_MINUTES = 3;
	public static final int ENDS_BEFORE_MINUTES =5;
	
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
	
	public static List<Concert> findStartConcertList(Integer startDate,Integer queryHours, Integer queryMinutes){
		
		Integer nextDate = DateUtil.calendarToInteger(DateUtil.getNextDay(DateUtil.getCalendarWithInteger(startDate), 1));
		return entityManager()
				.createQuery(
						"SELECT o FROM Concert o WHERE (startDate = :startDate AND ((startHours - :queryHours = 0 AND startMinutes - :queryMinutes = "+START_BEFORE_MINUTES+") OR (startHours - :queryHours = 1 AND startMinutes - :queryMinutes = "+(-1 * (60 - START_BEFORE_MINUTES))+" ))) " +
						"OR (startDate = :nextDate AND ((startHours - :queryHours = -23 AND startMinutes - :queryMinutes = "+(-1 * (60 - START_BEFORE_MINUTES))+")))",
					Concert.class).setParameter("startDate", startDate).setParameter("nextDate", nextDate).setParameter("queryHours",queryHours).setParameter("queryMinutes", queryMinutes)
				.getResultList();
	}
	
	public static List<Concert> findNowConcertList(Integer startDate,Integer queryHours, Integer queryMinutes){
		
		return entityManager()
				.createQuery(
						"SELECT o FROM Concert o WHERE startDate = :startDate AND :queryHours*100+:queryMinutes BETWEEN startHours*100+ startMinutes AND FLOOR(startHours + (duration - :endTime -1 + startMinutes) / 60)*100+(startMinutes+duration-:endTime -1 )%60",
					Concert.class).setParameter("startDate", startDate).setParameter("queryHours",queryHours).setParameter("queryMinutes", queryMinutes).setParameter("endTime", ENDS_BEFORE_MINUTES)
				.getResultList();
	}
	
	public static List<Concert> findEndConcertList(Integer startDate,Integer queryHours, Integer queryMinutes){
		Integer nextDate = DateUtil.calendarToInteger(DateUtil.getNextDay(DateUtil.getCalendarWithInteger(startDate), 1));
		return entityManager()
				.createQuery(
						"SELECT o FROM Concert o WHERE (startDate = :startDate AND (FLOOR(startHours + (duration+startMinutes) / 60) - :queryHours = 0 AND (startMinutes+duration )%60 -:queryMinutes = "+ENDS_BEFORE_MINUTES+") OR (FLOOR(startHours + (duration+startMinutes) / 60) - :queryHours = 1 AND (startMinutes+duration )%60 - :queryMinutes = "+(-1 * (60 - ENDS_BEFORE_MINUTES))+")) " +
						"OR (startDate = :nextDate AND ((FLOOR(startHours + (duration+startMinutes) / 60) - :queryHours = -23 AND FLOOR(startHours + (duration+startMinutes) / 60) - :queryMinutes = "+(-1 * (60 - ENDS_BEFORE_MINUTES))+")))",
					Concert.class).setParameter("startDate", startDate).setParameter("nextDate", nextDate).setParameter("queryHours",queryHours).setParameter("queryMinutes", queryMinutes)
				.getResultList();
	}
	
	public static List<Concert> findComingUpConcertList(long userId){
		Calendar cal = Calendar.getInstance();
		Integer startDate = DateUtil.calendarToInteger(cal);
		Integer startHours = cal.get(Calendar.HOUR_OF_DAY);
		Integer startMinutes = cal.get(Calendar.MINUTE);
		startDate = 20130412;
		startHours = 15;
		startMinutes = 31;
		return entityManager()
				.createQuery(
						"SELECT o FROM Concert o WHERE ((startDate = :startDate AND ((FLOOR(startHours + (duration+startMinutes) / 60) = :startHours AND (start_minutes + duration)%60 >= :startMinutes) OR  (FLOOR(startHours + (duration+startMinutes) / 60) > :startHours) ) ) OR startDate > :startDate) AND o.bandInfo.id IN (SELECT bandInfo.id from BandMember b where b.userInfo.id=:userId AND b.bandRoleType.id=:bandRoleTypeId)" +
						" ORDER BY startDate,startHours,startMinutes",
					Concert.class).setParameter("startDate", startDate).setParameter("startHours", startHours).setParameter("startMinutes",startMinutes).setParameter("userId", userId).setParameter("bandRoleTypeId", BandRoleType.BAND_ADMIN)
				.getResultList();
	}
}
