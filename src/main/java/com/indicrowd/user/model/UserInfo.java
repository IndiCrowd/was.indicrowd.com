package com.indicrowd.user.model;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.security.core.userdetails.UserDetails;

import com.indicrowd.auth.Auth;
import com.indicrowd.band.BandInfo;
import com.thoughtworks.xstream.annotations.XStreamOmitField;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class UserInfo implements UserDetails {
	private static final long serialVersionUID = 1949486363912552327L;

	/**
	 * 아이디
	 */
	@NotEmpty
	@Size(min = 4, max = 20)
	@Pattern(regexp = "[_a-z0-9-]*")
	@Column(length = 20, unique = true)
	private String username;

	/**
	 * 비밀번호
	 * 암호화 하면 암호의 길이 증가
	 */
	@JsonIgnore
	@XStreamOmitField
	@NotEmpty
	@Size(min = 4, max = 20)
	@Column(length = 40)
	private String password;

	/**
	 * 비밀번호 확인
	 * 비밀번호 확인은 저장하지 않음
	 */
	@JsonIgnore
	@XStreamOmitField
	@NotEmpty
	@Size(min = 4, max = 20)
	@Transient
	private String passwordConfirm;

	/**
	 * 닉네임
	 */
	@NotEmpty
	@Size(min = 2, max = 20)
	@Column(length = 20, unique = true)
	private String nickname;

	/**
	 * 이메일
	 */
	@NotEmpty
	@Size(max = 320)
	@Email
	@Column(length = 320)
	private String email;

	/**
	 * 가입일
	 */
	@Column(nullable = false)
	private Date joinDate;

	/**
	 * 마지막 로그인 일자
	 */
	@Column
	private Date lastLoginDate;

	/**
	 * 로그인 횟수
	 */
	@Column(nullable = false)
	private int loginCount;
	public void increaseLoginCount() { loginCount++; };

	/**
	 * 이용약관 동의
	 */
	@Column(nullable = false)
	private boolean termsAgree = false;

	// 이하는 소셜 유저를 위한 설정
	// 기본은 일반 유저이다.
	@Column(nullable = false)
	private boolean socialUser = false;
	@Column
	private String socialDisplayName;
	@Column
	private String socialImageUrl;
	@Column
	private String socialProfileUrl;
	@Column
	private String socialProviderId;
	@Column
	private String socialProviderUserId;
	
	/**
	 * 접근 가능한 유저 정보인가?
	 * 기본은 접근 가능하다.
	 */
	@Column(nullable = false)
	private boolean enabled = true;

	/**
	 * 권한 셋
	 */
	@OneToMany(mappedBy = "userInfo", cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
	private Set<UserAuth> auths = new HashSet<UserAuth>();
	
	@Transient
	private List<BandInfo> userBand;

	@Override
	public Set<Auth> getAuthorities() {
		Set<Auth> authorities = new HashSet<Auth>();
		for (UserAuth userAuth : auths) {
			authorities.add(userAuth.getAuth());
		}
		return authorities;
	}

	public void addAuth(String authority) {
		UserAuth userAuth = new UserAuth();
		userAuth.setAuth(Auth.findAuth(authority));
		userAuth.setUserInfo(this);
		this.auths.add(userAuth);
	}

	@Override public boolean isAccountNonExpired() { return true; }
	@Override public boolean isAccountNonLocked() { return true; }
	@Override public boolean isCredentialsNonExpired() { return true; }

	/**
	 * 아이디로 유저 정보를 찾습니다.
	 */
	public static UserInfo findUserInfoByUsername(String username) {
		return entityManager()
				.createQuery("SELECT o FROM UserInfo o WHERE o.enabled = true AND o.username = :username", UserInfo.class)
				.setParameter("username", username)
				.getSingleResult();
	}

	/**
	 * 이미 존재하는 아이디인가?
	 */
	public static boolean isUsernameExists(String username) {
		return entityManager()
				.createQuery("SELECT COUNT(o) FROM UserInfo o WHERE o.username = :username", Long.class)
				.setParameter("username", username)
				.getSingleResult() > 0l;
	}

	/**
	 * 이미 존재하는 닉네임인가?
	 */
	public static boolean isNicknameExists(String nickname) {
		return entityManager()
				.createQuery("SELECT COUNT(o) FROM UserInfo o WHERE o.nickname = :nickname", Long.class)
				.setParameter("nickname", nickname)
				.getSingleResult() > 0l;
	}
	
}
