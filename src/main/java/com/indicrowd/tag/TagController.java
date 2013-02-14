package com.indicrowd.tag;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.indicrowd.AbstractController;

@Controller
@RequestMapping("tag")
public class TagController extends AbstractController {

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void create() {
		// just view
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(@RequestParam String tagInputStr) {
		tagService.inputTag(tagInputStr);
		return "redirect:/tag/" + tagInputStr;
	}

	@RequestMapping(value = "/{tagStr}", method = RequestMethod.GET)
	public String view(@PathVariable String tagStr, Model model) {
		if (tagStr != null) {
			model.addAttribute("command", tagService.getTag(tagStr));
		}
		return "tag/view";
	}

}
