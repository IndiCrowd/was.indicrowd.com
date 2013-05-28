package com.indicrowd.fund;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.indicrowd.user.model.UserInfo;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Project {

	@NotEmpty
	@Size(max = 500)
	@Column(length = 500, nullable = false)
	private String title;

	@Size(max = 1000)
	@Column(length = 1000)
	private String summary;

	@Size(max = 200000)
	@Column(length = 200000)
	private String content;

	@ManyToOne
	@JoinColumn(name = "creatorId", nullable = false)
	private UserInfo creator;

	@Column(nullable = false)
	private Date createDate;

	/**
	 * 프로필 사진
	 */
	@Transient
	private CommonsMultipartFile profilePhoto;

	/**
	 * 추가 장르들
	 */
	@OneToMany(mappedBy = "project", cascade = { CascadeType.ALL }, fetch = FetchType.EAGER, orphanRemoval = true)
	private Set<ProjectGenre> genres = new HashSet<ProjectGenre>();

	@Transient
	private String genresStr;

	@NotNull
	@Column(nullable = false)
	private Date startDate;

	@NotNull
	@Column(nullable = false)
	private Date endDate;

	@Column(nullable = false)
	private int targetFigure;
	
	@Column(nullable = false)
	private boolean enabled = true;

	@NotEmpty
	@Size(max = 320)
	@Column(length = 320, nullable = false)
	private String contact;

	@NotEmpty
	@Column(nullable = true)
	private String bankName;
	
	@NotEmpty
	@Column(nullable = true)
	private String accountNumber;
	
	@NotEmpty
	@Column(nullable = true)
	private String accountName;
	
	@Column(nullable = false)
	private boolean opened = false;
	
	@Column
	private Date lastUpdateDate;

	@Column
	private String ip;
	
	public static List<Project> findAllProjects() {
        return entityManager().createQuery("SELECT o FROM Project o WHERE o.enabled = true ORDER BY id DESC", Project.class).getResultList();
    }

}
