package com.indicrowd.band;

import java.io.Serializable;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class BandInfo implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@NotEmpty
	String name;
	@NotEmpty
	String description;
	String category;
	String imageFilePath;
	
	public static List<BandInfo> findBandInfoListByUserId(long userId){
		return entityManager()
				.createQuery(
						"SELECT o.bandInfo FROM BandMember o WHERE o.userInfo.id = :userId",
						BandInfo.class).setParameter("userId", userId)
				.getResultList();
	}
}
