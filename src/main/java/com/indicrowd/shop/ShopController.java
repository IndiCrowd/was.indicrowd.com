package com.indicrowd.shop;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.indicrowd.AbstractController;

@Controller
@RequestMapping("/shop")
public class ShopController extends AbstractController {

	@Secured("ROLE_ADMIN")
	@RequestMapping("/create")
	public void create() {
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("/update")
	public void update() {
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("/remove")
	public void remove() {
	}
	
	@RequestMapping("/{id}")
	public void view(@PathVariable Long id) {
	}
	
	@RequestMapping("/{id}/{page}")
	public void view(@PathVariable Long id, @PathVariable Integer page) {
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("/{id}/newItem")
	public void newItem(@PathVariable Long id) {
	}

}
