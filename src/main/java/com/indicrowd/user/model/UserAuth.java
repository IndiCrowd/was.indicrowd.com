package com.indicrowd.user.model;

import java.io.Serializable;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.auth.Auth;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class UserAuth implements Serializable {
	private static final long serialVersionUID = -1907812055932698215L;

	@JsonBackReference
	@ManyToOne
	@JoinColumn(name = "userId", nullable = false)
	private UserInfo userInfo;

    @ManyToOne
	@JoinColumn(name = "auth", nullable = false)
	private Auth auth;
    
}
