package com.indicrowd.fund;

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

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Reward {

	@ManyToOne
	@JoinColumn(name = "projectId", nullable = false)
	private Project project;

	@NotNull
	@Transient
	private Long projectId;

	@Column(nullable = false)
	private int pledgeAmount;

	@NotEmpty
	@Size(max = 1000)
	@Column(length = 1000)
	private String description;

	@Column(nullable = false)
	private int maxInvestorCount;
	
	public static List<Reward> findAllRewardsByProjectId(Long projectId) {
		return entityManager().createQuery("SELECT o FROM Reward o WHERE o.project.id = :projectId ORDER BY o.id DESC", Reward.class).setParameter("projectId", projectId).getResultList();
	}

}
