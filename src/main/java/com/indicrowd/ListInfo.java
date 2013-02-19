package com.indicrowd;

import java.util.List;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * @author 심영재
 */
@RooJavaBean
@RooToString
public class ListInfo<C> {

	private Integer page; // 현재 페이지

	private Long count; // 전체 게시물 수

	private Integer countPerPage; // 한 페이지의 게시물 수

	public void setCountPerPage(Integer countPerPage) {
		this.countPerPage = countPerPage;
		calculateLastPage();
	}

	public void setCount(Long count) {
		this.count = count;
		calculateLastPage();
	}

	private Integer lastPage; // 전체 페이지 수

	private void calculateLastPage() {
		if (this.countPerPage != null && this.count != null) {
			lastPage = (int) Math.ceil((double) count / countPerPage);
		}
	}

	private List<C> list;

}
