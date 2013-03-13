package com.indicrowd.fund;

import java.io.IOException;

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
import com.indicrowd.ListInfo;

@Controller
@RequestMapping("/fund/reward")
public class RewardController extends AbstractController {

	@Secured("ROLE_USER")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void create(@ModelAttribute("command") Reward reward, Model model) {
		// just view
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("command") Reward reward, BindingResult bindingResult, Model model) throws IOException {

		if (bindingResult.hasErrors()) {
			return "fund/reward/create";
		} else {

			reward.setProject(Project.findProject(reward.getProjectId()));
			reward.persist();
			
			return "redirect:/fund/reward/" + reward.getId();
		}
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String view(@PathVariable Long id, Model model) {
		model.addAttribute("command", Reward.findReward(id));
		return "fund/reward/view";
	}
	
	@RequestMapping("/list")
	public String list(Long projectId, Model model) {

		model.addAttribute("command", ListInfo.getAllListInfo(Reward.findAllRewardsByProjectId(projectId)));

		return "fund/reward/list";
	}

}
