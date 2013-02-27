package com.indicrowd.fund;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.indicrowd.tag.Tag;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ProjectGenre {

	@JsonBackReference
	@ManyToOne
	@JoinColumn(name = "projectId", nullable = false)
	private Project project;

	@ManyToOne
	@JoinColumn(name = "tag", nullable = false)
	private Tag tag;

}
