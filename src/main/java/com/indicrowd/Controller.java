package com.indicrowd;

import org.springframework.web.bind.annotation.RequestMapping;

import com.indicrowd.band.BandInfo;

@org.springframework.stereotype.Controller
public class Controller extends AbstractController {

	@RequestMapping("/signin")
	public void signin() {
	}

	@RequestMapping("/")
	public String main() {
		System.out.println(BandInfo.findBandInfoListByUserId(1));
		return "main";
	}


	@RequestMapping("/jwp")
	public String jwp() {
		return "jwp";
	}

}
