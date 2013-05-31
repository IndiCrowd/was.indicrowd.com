package com.indicrowd.concert.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Hall implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@NotEmpty
	@Size(max = 200)
	@Column(length = 200, nullable = false)
	private String name;
	
	@Column(nullable = false)
	private Date createDate;
	
	@Column(nullable = false)
	private boolean isValid =true;
	
	public static List<Hall> getValidConcertHalls(){
		return entityManager()
				.createQuery(
						"SELECT o FROM Hall o WHERE o.isValid = true",
						Hall.class)
				.getResultList();
	}

}
