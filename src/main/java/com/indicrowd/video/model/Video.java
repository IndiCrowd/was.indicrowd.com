package com.indicrowd.video.model;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.band.BandInfo;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Video {
	
	@ManyToOne
	@JoinColumn(name = "bandId", nullable = false)
	BandInfo bandInfo;
	
	@NotEmpty
	String urlKey;
	
	Integer type = 0;
	
}
