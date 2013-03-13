package com.indicrowd.concert;

import java.util.Date;

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
import com.indicrowd.concert.model.Concert;
import com.indicrowd.concert.model.Hall;
import com.indicrowd.concert.model.IconFeed;
import com.indicrowd.concert.model.Message;

@Controller
@RequestMapping("concert")
public class ConcertController extends AbstractController {

	@RequestMapping
	public String main(Model model) {

		model.addAttribute("command", ListInfo.getAllListInfo(Concert.findAllConcerts()));

		return "concert/main";
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/reservate", method = RequestMethod.GET)
	public void reservate(@ModelAttribute("command") Concert concert, Model model) {
		// just view
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/reservate", method = RequestMethod.POST)
	public String reservate(@Valid @ModelAttribute("command") Concert concert, BindingResult bindingResult, Model model) {
		
		if (!bindingResult.hasFieldErrors("startDate") && !bindingResult.hasFieldErrors("endDate") && concert.getEndDate().getTime() < concert.getStartDate().getTime()) {
			bindingResult.rejectValue("startDate", "Over.startDate");
		}

		if (bindingResult.hasErrors()) {
			return "concert/reservate";
		} else {
			concert.setHall(Hall.findHall(concert.getHallId()));
			concert.persist();
			return "redirect:/concert";
		}
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{concertId}", method = RequestMethod.GET)
	public String view(@PathVariable("concertId") Long concertId, Model model) {
		model.addAttribute("command", Concert.findConcert(concertId));

		return "concert/view";
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{concertId}/admin", method = RequestMethod.GET)
	public String viewAdmin(@PathVariable("concertId") Long concertId, Model model) {
		model.addAttribute("command", Concert.findConcert(concertId));

		return "concert/viewAdmin";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/{concertId}/feed", method = RequestMethod.GET)
	public String viewFeed(@PathVariable("concertId") Long concertId, Model model) {
		model.addAttribute("command", Concert.findConcert(concertId));

		return "concert/viewFeed";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping("/{concertId}/iconFeed")
	public void iconFeed(@PathVariable("concertId") Long concertId, @Valid @ModelAttribute("command") IconFeed iconFeed, BindingResult bindingResult, Model model) {
		Concert concert = Concert.findConcert(concertId);
		
		if (concert != null) {

			iconFeed.setConcert(concert);
			iconFeed.setSender(authService.getUserInfo());
			iconFeed.setSendDate(new Date());
			iconFeed.persist();

			rtwService.send("Concert", iconFeed.getConcert().getId(), "iconFeed", iconFeed);
		}
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/chat", method = RequestMethod.POST)
	public String chat(@Valid @ModelAttribute("command") Message message, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "concert/chat";
		} else {
			Concert concert = Concert.findConcert(message.getConcertId());
			if (concert != null) {

				message.setConcert(concert);
				message.setSender(authService.getUserInfo());
				message.setSendDate(new Date());
				message.persist();

				rtwService.send("Concert", message.getConcert().getId(), "newMessage", message);
			}
			return "redirect:/concert/" + concert.getId();
		}
	}
	
	@RequestMapping("/{concertId}/chat/list")
	public String chatList(@PathVariable("concertId") Long concertId, Integer countPerPage, Model model) {
		list(concertId, 1, countPerPage, model);
		return "concert/chatList";
	}
	
	@RequestMapping("/{concertId}/chat/list/{page}")
	public String list(@PathVariable("concertId") Long concertId, @PathVariable int page, Integer countPerPage, Model model) {

		if (page < 1) {
			page = 1;
		}

		if (countPerPage == null) {
			countPerPage = 20;
		} else if (countPerPage > 50) {
			countPerPage = 50;
		}

		ListInfo<Message> listInfo = new ListInfo<Message>();

		listInfo.setPage(page);
		listInfo.setCountPerPage(countPerPage);
		listInfo.setCount(Message.countMessageByConcertId(concertId));
		listInfo.setList(Message.findMessageEntriesByConcertId(concertId, (page - 1) * countPerPage, countPerPage));

		model.addAttribute("command", listInfo);

		return "bbs/article/list";
	}

}
