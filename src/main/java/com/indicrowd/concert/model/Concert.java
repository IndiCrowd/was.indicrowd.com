package com.indicrowd.concert.model;

import java.util.Date;

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
	private Integer startTime;
	
	@Column(nullable = false)
	private Integer duration;

	@Column(nullable = false)
	private int audienceLimit;
	
	@Column(nullable = true)
	private String youtubeLink;
}
