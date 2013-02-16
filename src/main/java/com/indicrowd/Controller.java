package com.indicrowd;

import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class Controller extends AbstractController {
	
	@RequestMapping("/signin")
	public void signin() {
	}
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/__/realtimeweb/connect")
	public void __connect() {
		
	}
	
	@RequestMapping("/rtc")
	public String rtc(){
		return "rtc";
	}
	
	@RequestMapping("/jwp")
	public String jwp(){
		return "jwp";
	}

}
