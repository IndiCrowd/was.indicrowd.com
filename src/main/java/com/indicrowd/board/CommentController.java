package com.indicrowd.board;

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
@RequestMapping("comment")
public class CommentController extends AbstractController {

	@Secured("ROLE_USER")
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public void write(@Valid @ModelAttribute("command") Comment comment, BindingResult bindingResult, Model model, HttpServletRequest request) {
		if (!bindingResult.hasErrors()) {
			
			Article article = Article.findArticle(comment.getArticleId());
			
			comment.setWriter(authService.getUserInfo());
			comment.setWriteDate(new Date());
			comment.setIp(request.getRemoteAddr());
			comment.setArticle(article);
			comment.persist();
			
			article.increaseCommentCount();
			article.merge();
			
			rtwService.send("Comment", "article-" + comment.getArticleId(), "new", comment);
		}
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public void delete(@PathVariable Long id) {
		Comment comment = Comment.findComment(id);
		
		if (comment.getWriter().getId().equals(authService.getUserId())) {
			comment.setEnabled(false);
			comment.merge();
			
			Article article = comment.getArticle();
			article.decreaseCommentCount();
			article.merge();
			
			rtwService.send("Comment", "article-" + comment.getArticle().getId(), "remove", comment);
		}
	}

}
