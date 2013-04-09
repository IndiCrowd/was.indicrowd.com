package com.indicrowd.shop;

import java.util.Date;

import javax.validation.Valid;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.indicrowd.AbstractController;

@Controller
@RequestMapping("/shop")
public class ShopController extends AbstractController {

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void create(@ModelAttribute("command") Shop shop) {
		// just view
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("command") Shop shop, BindingResult bindingResult, Model model) {
		
		if (bindingResult.hasErrors()) {
			return "shop/create";
		} else {
			shop.setCreator(authService.getUserInfo());
			shop.setCreateDate(new Date());
			shop.persist();
			return "redirect:/item/list";
		}
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

}
