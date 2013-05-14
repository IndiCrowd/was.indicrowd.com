package com.indicrowd.band;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.indicrowd.energy.EnergyEntity;
@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class BandInfo implements Serializable, EnergyEntity {
	private static final long serialVersionUID = 1L;
	
	@NotEmpty
	@Size(max = 300)
	@Column(length = 300, nullable = false)
	String name;
	
	@NotEmpty
	@Size(max = 500)
	@Column(length = 500, nullable = false)
	String description;
	
	@NotEmpty
	@Size(max = 500)
	@Column(length = 500, nullable = false)
	String category;
	
	String imageFilePath;
	String bandMember;
	
	@Transient
	private CommonsMultipartFile profilePhoto;
	
	@Column(nullable = false)
	private Long energy = 0l;
	
	public static List<BandInfo> findBandInfoListByUserId(long userId){
		return entityManager()
				.createQuery(
						"SELECT o.bandInfo FROM BandMember o WHERE o.userInfo.id = :userId",
						BandInfo.class).setParameter("userId", userId)
				.getResultList();
	}
}
