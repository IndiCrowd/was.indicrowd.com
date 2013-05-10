package com.indicrowd.board;

import javax.validation.Valid;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@RequestMapping("/")
	public String main() {
		return null;
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void create(@ModelAttribute("command") Board board) {
		// just view
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("command") Board board, BindingResult bindingResult, Model model) {
		return null;
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("/update")
	public void update(@ModelAttribute("command") Board board) {
		// just view
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	public String update() {
		return null;
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("/delete")
	public void delete(@ModelAttribute("command") Board board) {
		// just view
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public String delete() {
		return null;
	}
	
	@RequestMapping("/{id}")
	public String view() {
		return null;
	}

}
