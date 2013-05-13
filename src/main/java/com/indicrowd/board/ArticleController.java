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
		
		if (bindingResult.hasErrors() || (article.getBoardId() <= 1 && !authService.checkRole("ROLE_ADMIN"))) {
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
			
			return "redirect:/board/" + board.getId();
		}
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
	public String update(@PathVariable Long id, Model model) {
		model.addAttribute("boards", Board.findAllBoards());
		model.addAttribute("command", Article.findArticle(id));
		return "article/update";
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
	public String update(@PathVariable Long id, @Valid @ModelAttribute("command") Article article, BindingResult bindingResult, Model model, HttpServletRequest request) throws IOException {
		
		Article originArticle = Article.findArticle(id);
		
		if (bindingResult.hasErrors() || (article.getBoardId() <= 1 && !authService.checkRole("ROLE_ADMIN")) || originArticle.getWriter().getId() != authService.getUserId()) {
			model.addAttribute("boards", Board.findAllBoards());
			return "article/update";
		} else {
			
			if (originArticle.getBoard() != null) {
			
				originArticle.getBoard().decreaseArticleCount();
				originArticle.getBoard().merge();
			
			}
			
			Board board = Board.findBoard(article.getBoardId());

			originArticle.setTitle(article.getTitle());
			originArticle.setContent(article.getContent());
			originArticle.setLastUpdateDate(new Date());
			originArticle.setIp(request.getRemoteAddr());
			originArticle.setBoard(board);

			if (article.getFile() != null && article.getFile().getSize() > 0) {
				originArticle.setHasFile(true);
				originArticle.setFilename(article.getFile().getOriginalFilename());
			}
			
			originArticle.merge();
			
			if (board != null) {
			
				board.increaseArticleCount();
				board.merge();
			
			}

			// 파일 저장
			if (article.getFile() != null && article.getFile().getSize() > 0) {
				fileService.save(article.getFile(), "articlefile/" + originArticle.getId().toString(), true);
			}
			
			return "redirect:/article/" + originArticle.getId();
		}
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public String deleteForm(@PathVariable Long id) {
		return "article/delete";
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.POST)
	public String delete(@PathVariable Long id) {
		
		Article article = Article.findArticle(id);
		Board board = Board.findBoard(article.getBoardId());	
		
		if (article.getWriter().getId() == authService.getUserId()) {
			article.setEnabled(false);
			article.merge();
		}
		
		return "redirect:/board/" + board.getId();
	}
	
	@RequestMapping("/{id}")
	public String read(@PathVariable Long id) {
		return "article/read";
	}

}
