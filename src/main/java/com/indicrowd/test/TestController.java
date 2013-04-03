package com.indicrowd.test;



import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.indicrowd.AbstractController;

@Controller
@RequestMapping("test")
public class TestController extends AbstractController {
	
	@RequestMapping("/item")
	public void procItem(Model model) {
		List<Item> items = new ArrayList<Item>();
		
		Item balloon = new Item();
	
		balloon.setName("물폭탄 ");
		balloon.setImageLocation("/IndiCrowd/img/avatar6.jpg");
		balloon.setRequestName("balloons");
		
		items.add(balloon);
		
		Item hand = new Item();
		
		hand.setName("박수 ");
		hand.setImageLocation("/IndiCrowd/img/avatar7.jpg");
		hand.setRequestName("yj_hands");
		
		items.add(hand);
			
		model.addAttribute("command", items);
		
	}
}
