package com.indicrowd.band;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.indicrowd.AbstractController;


@Controller
@RequestMapping("/band")
public class BandController extends AbstractController {
	@RequestMapping("/home")
	public String home(){
		System.out.println("Welcome to the Band Home!!");
		return "band/home";
	}
}
