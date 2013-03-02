package com.indicrowd.fund;

import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

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
import com.indicrowd.tag.Tag;

@Controller
@RequestMapping("/fund/project")
public class ProjectController extends AbstractController {

	private static final int NORMAL_COUNT_PER_PAGE = 10;
	private static final int MAX_COUNT_PER_PAGE = 50;

	@Secured("ROLE_USER")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void create(@ModelAttribute("command") Project project, Model model) {
		// just view
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("command") Project project, BindingResult bindingResult, Model model) throws IOException {

		if (!bindingResult.hasFieldErrors("profilePhoto") && project.getProfilePhoto() != null && project.getProfilePhoto().getSize() > 0 && !imageService.isImageFile(project.getProfilePhoto())) {
			bindingResult.rejectValue("profilePhoto", "NotImage.profilePhoto");
		}
		if (!bindingResult.hasFieldErrors("startDate") && !bindingResult.hasFieldErrors("endDate") && project.getEndDate().getTime() < project.getStartDate().getTime()) {
			bindingResult.rejectValue("startDate", "Over.startDate");
		}

		if (bindingResult.hasErrors()) {
			return "fund/project/create";
		} else {

			// 장르 태그
			Set<Tag> genreTags = tagService.inputTags(project.getGenresStr());

			Set<ProjectGenre> genres = new HashSet<ProjectGenre>();
			for (Tag genreTag : genreTags) {
				ProjectGenre genre = new ProjectGenre();
				genre.setTag(genreTag);
				genre.setProject(project);
				genres.add(genre);
			}
			project.setGenres(genres);

			project.setCreator(authService.getUserInfo());
			project.setCreateDate(new Date());
			project.persist();

			if (project.getProfilePhoto().getSize() > 0) {
				fileService.save(project.getProfilePhoto(), "projectphoto/" + project.getId().toString(), true);
				fileService.save(imageService.generateThumb(project.getProfilePhoto()), "projectthumb/" + project.getId().toString(), true);
			}

			return "redirect:/fund/project/" + project.getId() + "/rewards";
		}
	}

	@Secured("ROLE_USER")
	@RequestMapping("/{projectId}/rewards")
	public String rewards(@PathVariable Long projectId, Model model) {
		model.addAttribute("command", Project.findProject(projectId));
		return "fund/project/rewards";
	}

	@Secured("ROLE_USER")
	@RequestMapping("/{projectId}/open")
	public String open(@PathVariable Long projectId, Model model) {

		Project project = Project.findProject(projectId);
		if (project.getCreator().getId().equals(authService.getUserId())) {
			project.setOpened(true);
			project.merge();
		}

		return "redirect:/fund/project/" + projectId;
	}

	@RequestMapping("/list")
	public void list(Integer countPerPage, Model model) {
		list(1, countPerPage, model);
	}

	@RequestMapping("/list/{page}")
	public String list(@PathVariable int page, Integer countPerPage, Model model) {

		if (page < 1) {
			page = 1;
		}

		if (countPerPage == null) {
			countPerPage = NORMAL_COUNT_PER_PAGE;
		} else if (countPerPage > MAX_COUNT_PER_PAGE) {
			countPerPage = MAX_COUNT_PER_PAGE;
		}

		ListInfo<Project> listInfo = new ListInfo<Project>();

		listInfo.setPage(page);
		listInfo.setCountPerPage(countPerPage);
		listInfo.setCount(Project.countProjects());
		listInfo.setList(Project.findProjectEntries((page - 1) * countPerPage, countPerPage));

		model.addAttribute("command", listInfo);

		return "fund/project/list";
	}

	@RequestMapping("/{id}")
	public String view(@PathVariable Long id, Model model) {
		model.addAttribute("command", Project.findProject(id));
		return "fund/project/view";
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{id}/invest", method = RequestMethod.GET)
	public String invest(@PathVariable Long id, @ModelAttribute("command") Investor investor, Model model) {
		model.addAttribute("rewards", Reward.findAllRewardsByProjectId(id));
		return "fund/project/invest";
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{id}/invest", method = RequestMethod.POST)
	public String invest(@PathVariable Long id, @Valid @ModelAttribute("command") Investor investor, BindingResult bindingResult, Model model) throws IOException {

		if (bindingResult.hasErrors()) {
			model.addAttribute("rewards", Reward.findAllRewardsByProjectId(id));
			return "fund/project/invest";
		} else {

			investor.setUserInfo(authService.getUserInfo());
			investor.setProject(Project.findProject(id));

			if (investor.getRewardId() != null) {
				investor.setReward(Reward.findReward(investor.getRewardId()));
			}

			investor.setInvestDate(new Date());
			investor.persist();

			return "redirect:/fund/investor/" + investor.getId();
		}
	}

}
