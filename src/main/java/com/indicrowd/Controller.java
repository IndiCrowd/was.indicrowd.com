package com.indicrowd;

import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class Controller extends AbstractController {

	@RequestMapping("/signin")
	public void signin() {
	}

	@RequestMapping("/")
	public String main() {

		if (authService.isAnonymous()) {
			return "redirect:/landing";
		} else {
			return "redirect:/main";
		}
	}
	
	@RequestMapping("/main")
	public void main1() {
	}
	
	@RequestMapping("/main2")
	public void main2() {
	}
	
	@RequestMapping("/landing")
	public void landing() {
	}

	@RequestMapping("/jwp")
	public String jwp() {
		return "jwp";
	}

	@RequestMapping("/about")
	public void about() {
	}

	@RequestMapping("/help")
	public void help() {
	}

	@RequestMapping("/terms")
	public void terms() {
	}

	@RequestMapping("/policy")
	public void policy() {
	}

	@RequestMapping("/contact")
	public void contact() {
	}
	
	@RequestMapping("/energy")
	public void energy() {
	}

}
