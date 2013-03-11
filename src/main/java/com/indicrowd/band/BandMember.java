package com.indicrowd.band;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.user.model.UserInfo;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class BandMember {
	@ManyToOne
	@JoinColumn(name = "userId", nullable = false)
	UserInfo userInfo;
	@ManyToOne
	@JoinColumn(name = "bandId", nullable = false)
	BandInfo bandInfo;
	@ManyToOne
	@JoinColumn(name = "bandRoleTypeId", nullable = false)
	BandRoleType bandRoleType;
	String alias;
}
