package com.indicrowd;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.indicrowd.auth.AuthService;
import com.indicrowd.file.FileService;
import com.indicrowd.file.ImageService;
import com.indicrowd.rtw.RTWService;
import com.indicrowd.shop.ItemService;
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
	
	@Autowired
	protected KeyValueListCacheService keyValueListCacheService;
	
	@Autowired
	protected ItemService itemService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));

		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	@ModelAttribute("signedUserInfo")
	public UserInfo getSignedUserInfo() {
		return authService.getUserInfo();
	}

}
