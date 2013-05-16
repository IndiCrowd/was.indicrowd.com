package com.indicrowd.board;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.indicrowd.user.model.UserInfo;
import com.thoughtworks.xstream.annotations.XStreamOmitField;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Article {

	@ManyToOne
	@JoinColumn(name = "boardId", nullable = false)
	private Board board;

	@NotNull
	@Transient
	private Long boardId;

	@NotEmpty
	@Size(max = 500)
	@Column(length = 500, nullable = false)
	private String title;

	@NotEmpty
	@Size(max = 10000)
	@Column(length = 10000)
	private String content;

	@ManyToOne
	@JoinColumn(name = "writerId", nullable = false)
	private UserInfo writer;

	@Column(nullable = false)
	private Date writeDate;

	@Column
	private Date lastUpdateDate;

	@Column
	private String ip;

	@XStreamOmitField
	@Transient
	private CommonsMultipartFile file;

	private boolean hasFile;

	@Column
	private String filename;

	private int commentCount;

	public void increaseCommentCount() {
		commentCount++;
	};

	public void decreaseCommentCount() {
		commentCount--;
	};

	private int viewCount;

	public void increaseViewCount() {
		viewCount++;
	};

	private boolean enabled = true;
	
	public static long countArticlesByBoardId(Long boardId) {
		return entityManager().createQuery("SELECT COUNT(o) FROM Article o WHERE o.enabled = true AND o.board.id = :boardId", Long.class).setParameter("boardId", boardId).getSingleResult();
	}
	
	public static List<Article> findArticleEntriesByBoardId(Long boardId, int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Article o WHERE o.enabled = true AND o.board.id = :boardId ORDER BY o.id DESC", Article.class).setParameter("boardId", boardId).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }

}
