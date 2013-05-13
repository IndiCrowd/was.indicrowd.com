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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.indicrowd.AbstractController;

@Controller
@RequestMapping("article")
public class ArticleController extends AbstractController {

	@Secured("ROLE_USER")
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void write(@ModelAttribute("command") Article article, Model model) {
		model.addAttribute("boards", Board.findAllBoards());
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@Valid @ModelAttribute("command") Article article, BindingResult bindingResult, Model model, HttpServletRequest request) throws IOException {
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("boards", Board.findAllBoards());
			return "article/write";
		} else {
			Board board = Board.findBoard(article.getBoardId());

			article.setWriter(authService.getUserInfo());
			article.setWriteDate(new Date());
			article.setIp(request.getRemoteAddr());
			article.setBoard(board);

			if (article.getFile() != null && article.getFile().getSize() > 0) {
				article.setHasFile(true);
				article.setFilename(article.getFile().getOriginalFilename());
			}
			
			article.persist();
			
			if (board != null) {
			
				board.increaseArticleCount();
				board.merge();
			
			}

			// 파일 저장
			if (article.getFile() != null && article.getFile().getSize() > 0) {
				fileService.save(article.getFile(), "articlefile/" + article.getId().toString(), true);
			}
			
			return "redirect:/board/" + article.getBoard().getId();
		}
	}
	
	@Secured("ROLE_USER")
	@RequestMapping("/update")
	public void update(@ModelAttribute("command") Board board) {
		// just view
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	public String update() {
		return null;
	}
	
	@Secured("ROLE_USER")
	@RequestMapping("/delete")
	public void delete(@ModelAttribute("command") Board board) {
		// just view
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public String delete() {
		return null;
	}
	
	@RequestMapping("/{id}")
	public String read() {
		return null;
	}

}
