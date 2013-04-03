package com.indicrowd.shop;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.indicrowd.AbstractController;

@Controller
@RequestMapping("/item")
public class ItemController extends AbstractController {
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/{id}")
	public void update(@PathVariable Long id) {
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/{id}")
	public void remove(@PathVariable Long id) {
	}

}
