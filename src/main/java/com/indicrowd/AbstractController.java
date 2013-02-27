package com.indicrowd;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.indicrowd.auth.AuthService;
import com.indicrowd.file.FileService;
import com.indicrowd.file.ImageService;
import com.indicrowd.rtw.RTWService;
import com.indicrowd.tag.TagService;
import com.indicrowd.user.model.UserInfo;

public abstract class AbstractController {
	
	@Autowired
	protected AuthService authService;
	
	@Autowired
	protected FileService fileService;
	
	@Autowired
	protected ImageService imageService;
	
	@Autowired
	protected TagService tagService;
	
	@Autowired
	protected RTWService rtwService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}

	@ModelAttribute("signedUserInfo")
	public UserInfo getSignedUserInfo() {
		return authService.getUserInfo();
	}

}
