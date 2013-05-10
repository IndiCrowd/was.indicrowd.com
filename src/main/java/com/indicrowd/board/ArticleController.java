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
@RequestMapping("article")
public class ArticleController {

	@Secured("ROLE_USER")
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void write(@ModelAttribute("command") Article article) {
		// just view
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@Valid @ModelAttribute("command") Article article, BindingResult bindingResult, Model model) {
		
		if (bindingResult.hasErrors()) {
			return "article/write";
		} else {
			return null;
			/*
			Board board = Board.findBoard(article.getBoardId());

			article.setWriter(authService.getUserInfo());
			article.setWriteDate(new Date());
			article.setIp(request.getRemoteAddr());
			article.setBoard(board);

			// 장르
			article.setMainGenre(tagService.inputTag(article.getMainGenreStr()));

			// 장르 태그
			Set<Tag> genreTags = tagService.inputTags(article.getGenresStr());

			Set<ArticleGenre> genres = new HashSet<ArticleGenre>();
			for (Tag genreTag : genreTags) {
				ArticleGenre genre = new ArticleGenre();
				genre.setTag(genreTag);
				genre.setArticle(article);
				genres.add(genre);
			}
			article.setGenres(genres);

			// 참가자
			Set<UserInfo> participantUserInfos = userService.loadUserByNicknameStr(article.getParticipantsStr());

			Set<ArticleParticipant> participants = new HashSet<ArticleParticipant>();
			for (UserInfo participantUserInfo : participantUserInfos) {
				ArticleParticipant participant = new ArticleParticipant();
				participant.setUserInfo(participantUserInfo);
				participant.setArticle(article);
				participants.add(participant);
			}
			article.setParticipants(participants);

			if (article.getFile() != null && article.getFile().getSize() > 0 && audioService.isMp3File(article.getFile())) {
				article.setHasFile(true);
			}
			
			if (board != null && board.getGroupInfo() != null) {
				// 그룹 글이면 일단 광장에서는 보이지 않는다.
				article.setShowSquare(false);
			}

			article.persist();
			
			UserInfo userInfo = UserInfo.findUserInfo(authService.getUserId());
			userInfo.increaseWriteCount();
			userInfo.merge();
			
			if (board != null) {
			
				board.increaseArticleCount();
	
				if (board.getGroupInfo() != null) {
					GroupInfo groupInfo = GroupInfo.findGroupInfo(board.getGroupInfo().getId());
					groupInfo.setLastUpdateDate(new Date());
					groupInfo.merge();
				}
				
				board.merge();
			
			}

			// 파일 저장
			if (article.getFile() != null && article.getFile().getSize() > 0 && audioService.isMp3File(article.getFile())) {
				fileService.save(article.getFile(), "article/" + article.getId().toString(), true);
				// if (imageService.isImageFile(article.getFile())) {
				// fileService.save(imageService.generateThumb(article.getFile()),
				// "articlethumb/" + article.getId().toString(), true);
				// }
			}
			
			if (board == null || board.getGroupInfo() == null) {
				rtwService.send("Board", "all", "newArticle", article);
			}
			
			Log log = new Log();
			log.setKind("article");
			log.setTitle(article.getTitle() == null ? "글 " : article.getTitle() + "를 업로드 했습니다.");
			log.setUrl("/bbs/article/" + article.getId());
			log.setUserInfo(userInfo);
			log.setLogDate(new Date());
			log.persist();

			if (article.getBoard() == null) {
				return "redirect:/bbs/article/list";
			} else {
				rtwService.send("Board", article.getBoardId(), "newArticle", article);
				return "redirect:/bbs/article/list?boardId=" + article.getBoard().getId();
			}*/
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
