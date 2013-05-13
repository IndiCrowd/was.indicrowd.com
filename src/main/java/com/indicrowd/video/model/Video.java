package com.indicrowd.video.model;

import java.util.List;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.band.BandInfo;
import com.indicrowd.concert.model.Concert;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Video {
	public static final Integer YOUTUBE_VIDEO = 0;
	public static final Integer INDICROWD_CONCERT = 1;
	
	@ManyToOne
	@JoinColumn(name = "bandId", nullable = false)
	BandInfo bandInfo;
	
	@NotEmpty
	String urlKey;
	
	Integer type = 0;

	public static List<Video> findVideoByBandId(Long bandId) {
		return entityManager()
				.createQuery(
						"SELECT o FROM Video o WHERE o.bandInfo.id = :bandId " +
						" ORDER BY id DESC",
						Video.class).setParameter("bandId", bandId)
				.getResultList();
	}
	
}
