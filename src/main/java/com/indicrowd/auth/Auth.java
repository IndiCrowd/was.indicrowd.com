package com.indicrowd.auth;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.security.core.GrantedAuthority;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Auth implements GrantedAuthority {
	private static final long serialVersionUID = -5528202813856927756L;

	@Id
	@NotNull
	@Column(nullable = false)
	private String authority;

	@NotNull
	@Column(nullable = false)
	private String name;

}
