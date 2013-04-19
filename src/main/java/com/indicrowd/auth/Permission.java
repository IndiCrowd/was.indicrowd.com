package com.indicrowd.auth;

import org.springframework.security.core.Authentication;

public interface Permission {
	boolean isAllowed(Authentication authentication, Object targetDomainObject);
}
