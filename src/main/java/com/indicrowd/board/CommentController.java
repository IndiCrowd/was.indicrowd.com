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
@RequestMapping("comment")
public class CommentController {

	@Secured("ROLE_USER")
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@Valid @ModelAttribute("command") Board board, BindingResult bindingResult, Model model) {
		return null;
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	public String update() {
		return null;
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public String delete() {
		return null;
	}

}
