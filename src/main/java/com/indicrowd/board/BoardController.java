package com.indicrowd.board;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
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
@RequestMapping("board")
public class BoardController extends AbstractController {
	
	@RequestMapping()
	public String main(Model model) {
		//model.addAttribute("boards", Board.findAllBoards());
		return "redirect:/board/1";
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void create(@ModelAttribute("command") Board board) {
		// just view
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("command") Board board, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "board/create";
		} else {
			
			board.setCreator(authService.getUserInfo());
			board.setCreateDate(new Date());
			board.persist();
			
			return "redirect:/board/" + board.getId();
		}
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
	public String update(@PathVariable Long id) {
		return "board/update";
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
	public String update(@PathVariable Long id, @Valid @ModelAttribute("command") Board board, BindingResult bindingResult, Model model, HttpServletRequest request) throws IOException {
		return null;
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public String deleteForm(@PathVariable Long id) {
		return "board/delete";
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.POST)
	public String delete(@PathVariable Long id) {
		return null;
	}
	
	@RequestMapping("/{id}")
	public String view(@PathVariable Long id, Model model) {
		return view(id, 1, model);
	}
	
	@RequestMapping("/{id}/{page}")
	public String view(@PathVariable Long id, @PathVariable int page, Model model) {
		
		if (page < 1) {
			page = 1;
		}
		
		ListInfo<Article> listInfo = new ListInfo<Article>();
		
		listInfo.setPage(page);
		listInfo.setCountPerPage(10);
		listInfo.setCount(Article.countArticlesByBoardId(id));
		listInfo.setList(Article.findArticleEntriesByBoardId(id, (page - 1) * 10, 10));
		
		model.addAttribute("command", Board.findBoard(id));
		model.addAttribute("articleListInfo", listInfo);
		model.addAttribute("boards", Board.findAllBoards());
		
		return "board/view";
	}

}
