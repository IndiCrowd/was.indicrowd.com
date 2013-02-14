package com.indicrowd.tag;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class TagInput {

	@Id
	@Column(nullable = false)
	private String tagInputStr;

	@JsonBackReference
	@OneToOne(mappedBy = "repTagInput", cascade = { CascadeType.ALL })
	private Tag tag;

	@Column(nullable = false)
	private long point;

	public void increasePoint() {
		this.point++;
	}

}
