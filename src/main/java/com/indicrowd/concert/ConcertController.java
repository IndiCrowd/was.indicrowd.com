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
import com.indicrowd.concert.model.Message;
import com.indicrowd.realtimeweb.RealtimeWebServer;

@Controller
@RequestMapping("concert")
public class ConcertController extends AbstractController {

	@RequestMapping
	public String main(Model model) {

		ListInfo<Concert> listInfo = new ListInfo<Concert>();
		listInfo.setList(Concert.findAllConcerts());
		model.addAttribute("command", listInfo);

		return "concert/main";
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void create(@ModelAttribute("command") Concert concert, Model model) {
		// just view
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("command") Concert concert, BindingResult bindingResult, Model model) {

		if (bindingResult.hasErrors()) {
			return "concert/create";
		} else {
			concert.persist();
			return "redirect:/concert/" + concert.getId();
		}
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{concertId}", method = RequestMethod.GET)
	public String hall(@PathVariable("concertId") Long concertId, Model model) {
		model.addAttribute("command", Concert.findConcert(concertId));
		return "concert/view";
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{concertId}/admin", method = RequestMethod.GET)
	public String hallAdmin(@PathVariable("concertId") Long concertId, Model model) {
		model.addAttribute("command", Concert.findConcert(concertId));
		return "concert/viewAdmin";
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/chat", method = RequestMethod.POST)
	public void chat(@ModelAttribute("command") Message message) {
		if (message.getConcertId() != null) {
			Concert concert = Concert.findConcert(message.getConcertId());
			if (concert != null) {

				message.setConcert(concert);
				message.setSender(authService.getUserInfo());
				message.setSendDate(new Date());
				message.persist();

				RealtimeWebServer.send("Concert", message.getConcert().getId(), "newMessage", message);
			}
		}
	}

}
