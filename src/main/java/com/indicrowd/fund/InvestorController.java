package com.indicrowd.fund;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.indicrowd.AbstractController;

@Controller
@RequestMapping("/fund/investor")
public class InvestorController extends AbstractController {
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String view(@PathVariable Long id, Model model) {
		model.addAttribute("command", Investor.findInvestor(id));
		return "fund/investor/view";
	}

}
