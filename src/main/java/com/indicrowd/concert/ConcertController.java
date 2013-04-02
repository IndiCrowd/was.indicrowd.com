package com.indicrowd.concert;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.indicrowd.band.BandInfo;
import com.indicrowd.concert.model.Concert;
import com.indicrowd.concert.model.Hall;
import com.indicrowd.concert.model.IconFeed;
import com.indicrowd.concert.model.Message;
import com.indicrowd.concert.model.UserState;

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

		System.out.println(bindingResult.toString());

		if (bindingResult.hasErrors()) {
			return "concert/reservate";
		} else {
			concert.setHall(Hall.findHall(concert.getHallId()));
			concert.setBandInfo(BandInfo.findBandInfo(concert.getBandId()));
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
	@RequestMapping("/{concertId}/userState")
	public void updateUserState(@PathVariable("concertId") Long concertId,@Valid @ModelAttribute("command")UserState userState , BindingResult bindingResult, Model model) {
		Concert concert = Concert.findConcert(concertId);

		if (concert != null) {
			
			rtwService.send("Concert", concert.getId(), "userState", userState);
		}
	}
	
	private String getChatIndexKey(Long targetConcertId) {
		return "IndiCrowd:concert:" + targetConcertId + ":chat";
	}

	public String getChatKey(Long id) {
		return "IndiCrowd:chat:" + id;
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

				String chatKey = getChatKey(message.getId());
				keyValueListCacheService.set(chatKey, message);
				keyValueListCacheService.addIndex(getChatIndexKey(concert.getId()), message.getId(), chatKey);

				rtwService.send("Concert", message.getConcert().getId(), "newMessage", message);
			}
			return "redirect:/concert/" + concert.getId();
		}
	}

	@RequestMapping("/{concertId}/chat/list")
	public String chatList(@PathVariable("concertId") Long concertId, Integer countPerPage, Model model) {
		chatList(concertId, 1, countPerPage, model);
		return "concert/chatList";
	}

	@RequestMapping("/{concertId}/chat/cachedList")
	public String chatCachedList(@PathVariable("concertId") Long concertId, Integer countPerPage, Model model) {
		chatCachedList(concertId, 1, countPerPage, model);
		return "concert/chatList";
	}
	
	@RequestMapping("/{concertId}/chat/cachedList/{page}")
	public void chatCachedList(@PathVariable("concertId") Long concertId, @PathVariable int page, Integer countPerPage, Model model) {
		
		if (page < 1) {
			page = 1;
		}

		if (countPerPage == null) {
			countPerPage = 20;
		} else if (countPerPage > 50) {
			countPerPage = 50;
		}

		Map<String, Integer> emptyValueIndexMap = new HashMap<String, Integer>();
		List<String> chatJsonList = keyValueListCacheService.listDesc(getChatIndexKey(concertId), 0l, countPerPage, emptyValueIndexMap);
		
		String returnJson = "{\"command\": {\"list\": [";
		for (int i = 0; i < chatJsonList.size(); i++) {
			returnJson += chatJsonList.get(i);
			if (i != chatJsonList.size() - 1) {
				returnJson += ",";
			}
		}
		returnJson += "]}}";

		model.addAttribute("json", returnJson);
	}

	@RequestMapping("/{concertId}/chat/list/{page}")
	public String chatList(@PathVariable("concertId") Long concertId, @PathVariable int page, Integer countPerPage, Model model) {

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
