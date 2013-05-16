package com.indicrowd.board;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.user.model.UserInfo;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Comment {
	
	@ManyToOne
	@JoinColumn(name = "articleId", nullable = false)
	private Article article;
	
	@Transient
	private Long articleId;
	
	@NotEmpty
	@Size(max = 500)
	@Column(length = 500, nullable = false)
	private String content;
	
	@ManyToOne
	@JoinColumn(name = "writerId", nullable = false)
	private UserInfo writer;

	@Column(nullable = false)
	private Date writeDate;

	@Column
	private String ip;
	
	private boolean enabled = true;

	public static List<Comment> findAllCommentEntriesByArticleId(Long articleId) {
		return entityManager().createQuery("SELECT o FROM Comment o WHERE o.enabled = true AND o.article.id = :articleId ORDER BY o.id ASC", Comment.class).setParameter("articleId", articleId).getResultList();
	}

}
