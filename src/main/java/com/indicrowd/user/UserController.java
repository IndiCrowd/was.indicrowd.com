package com.indicrowd.user;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.indicrowd.AbstractController;
import com.indicrowd.user.model.UserInfo;

@Controller
@RequestMapping("user")
public class UserController extends AbstractController {
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private SaltSource saltSource;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void join(@ModelAttribute("command") UserInfo userInfo, Model model) {
		if (authService.isAuthenticated()) {
			model.addAttribute("command", authService.getUserInfo());
		}
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@Valid @ModelAttribute("command") UserInfo userInfo, BindingResult bindingResult, Model model) throws IOException {
		
		// other validations
		
		// 비밀번호 확인
		if (!bindingResult.hasFieldErrors("password") && !userInfo.getPassword().equals(userInfo.getPasswordConfirm())) {
			bindingResult.rejectValue("password", "Equals.passwordConfirm");
		}
		if (!bindingResult.hasFieldErrors("username") && UserInfo.isUsernameExists(userInfo.getUsername(), true)) {
			bindingResult.rejectValue("username", "Exists.username");
		}
		if (!bindingResult.hasFieldErrors("nickname") && UserInfo.isNicknameExists(userInfo.getNickname(), true)) {
			bindingResult.rejectValue("nickname", "Exists.nickname");
		}
		if (!bindingResult.hasFieldErrors("termsAgree") && !userInfo.isTermsAgree()) {
			bindingResult.rejectValue("termsAgree", "NotAgree.termsAgree");
		}
		
		if (bindingResult.hasErrors()) {
			return "user/join";
		} else {
			
			// password encoding
			userInfo.setPassword(passwordEncoder.encodePassword(userInfo.getPassword(), saltSource.getSalt(userInfo)));
			userInfo.setJoinDate(new Date());
			
			userInfo.addAuth("ROLE_USER");
			userInfo.persist();
			
			if (userInfo.getProfilePhoto() != null && userInfo.getProfilePhoto().getSize() > 0) {
				fileService.save(userInfo.getProfilePhoto(), "profilephoto/" + userInfo.getId().toString(), true);
				fileService.save(imageService.generateThumb(userInfo.getProfilePhoto()), "profilethumb/" + userInfo.getId().toString(), true);
			} else {
				File file = fileService.load("img/blankuser.gif");
				fileService.save(file, "profilephoto/" + userInfo.getId().toString(), true);
				fileService.save(imageService.generateThumb(file), "profilethumb/" + userInfo.getId().toString(), true);
			}
			
			authService.auth(userInfo);
			
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String viewInfo(@PathVariable Long id, Model model) {
		UserInfo userInfo = UserInfo.findUserInfo(id);
		model.addAttribute("command", userInfo);
		return "user/viewInfo";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void update(Model model) {
		model.addAttribute("command", authService.getUserInfo());
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("command") UserInfo userInfo, BindingResult bindingResult, Model model) throws IOException {
		
		UserInfo originUserInfo = UserInfo.findUserInfo(authService.getUserId());
		
		// 비밀번호 확인
		if (!bindingResult.hasFieldErrors("password") && !userInfo.getPassword().equals(userInfo.getPasswordConfirm())) {
			bindingResult.rejectValue("password", "Equals.passwordConfirm");
		}
		if (!bindingResult.hasFieldErrors("username") && !originUserInfo.getUsername().equals(userInfo.getUsername()) && UserInfo.isUsernameExists(userInfo.getUsername(), true)) {
			bindingResult.rejectValue("username", "Exists.username");
		}
		if (!bindingResult.hasFieldErrors("nickname") && !originUserInfo.getNickname().equals(userInfo.getNickname()) && UserInfo.isNicknameExists(userInfo.getNickname(), true)) {
			bindingResult.rejectValue("nickname", "Exists.nickname");
		}
		
		if (bindingResult.hasErrors()) {
			return "user/update";
		} else {
			
			originUserInfo.setPassword(passwordEncoder.encodePassword(userInfo.getPassword(), saltSource.getSalt(userInfo)));
			originUserInfo.setUsername(userInfo.getUsername());
			originUserInfo.setNickname(userInfo.getNickname());
			originUserInfo.merge();
			
			if (userInfo.getProfilePhoto() != null && userInfo.getProfilePhoto().getSize() > 0) {
				fileService.save(userInfo.getProfilePhoto(), "profilephoto/" + originUserInfo.getId().toString(), true);
				fileService.save(imageService.generateThumb(userInfo.getProfilePhoto()), "profilethumb/" + originUserInfo.getId().toString(), true);
			}
			
			authService.auth(originUserInfo);
			
			return "redirect:/user/" + originUserInfo.getId();
		}
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/leave", method = RequestMethod.GET)
	public void leave(Model model) {
		model.addAttribute("command", authService.getUserInfo());
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/leave", method = RequestMethod.POST)
	public String leave() {
		
		UserInfo userInfo = UserInfo.findUserInfo(authService.getUserId());
		userInfo.setEnabled(false);
		userInfo.merge();
		
		return "redirect:/signout";
	}
	
}
