package com.indicrowd.tag;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Tag {

	@Id
	@Column
	private String tagStr;

	@OneToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name = "repTagInput", nullable = false)
	private TagInput repTagInput;

	@Column(nullable = false)
	private long point;

	public void increasePoint() {
		this.point++;
	}

}
