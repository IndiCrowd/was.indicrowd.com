package com.indicrowd.concert;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.validation.Valid;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.indicrowd.AbstractController;
import com.indicrowd.ListInfo;
import com.indicrowd.band.BandInfo;
import com.indicrowd.concert.model.Concert;
import com.indicrowd.concert.model.ConcertState;
import com.indicrowd.concert.model.Hall;
import com.indicrowd.concert.model.IconFeed;
import com.indicrowd.concert.model.Message;
import com.indicrowd.concert.model.UserState;
import com.indicrowd.shop.Item;
import com.indicrowd.user.model.UserInfo;
import com.indicrowd.util.DateUtil;

@Controller
@RequestMapping("concert")
public class ConcertController extends AbstractController {

	@RequestMapping
	public String main(Model model) {
		
		
		/*Map<String, List<Concert>> concertList = new HashMap<String, List<Concert>>(); 
		List<Hall> validHalls = Hall.getValidConcertHalls();
		for(int i=0; i<validHalls.size();i++){
			Hall nowHall = validHalls.get(i);
			concertList.put(nowHall.getName(), Concert.findConcertListByDateAndHall(Integer.valueOf(DateUtil.getDateString(DateUtil.getCalendar(), "YYYYMMDD")), nowHall.getId()));
		}
		model.addAttribute("command", concertList);*/
		
		ListInfo<Concert> listInfo = new ListInfo<Concert>();
		//List<Concert> list = Concert.findConcertListByDate(Integer.valueOf(DateUtil.getDateString(DateUtil.getCalendar(), "YYYYMMDD")));
		List<Concert> list = Concert.findAllConcerts();

		listInfo.setPage(1);
		listInfo.setCountPerPage(-1);
		listInfo.setCount((long) list.size());
		
		// 우선 전체 다 가져옴
		listInfo.setList(list);

		model.addAttribute("command", listInfo);
		
		model.addAttribute("comingUpConcertList", Concert.findComingUpConcertList(3));
		
		return "concert/main";
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/reserve", method = RequestMethod.GET)
	public void reserve(@ModelAttribute("command") Concert concert, Model model) {
		
	}
	
	@RequestMapping(value = "/reserve/validateTime", method = RequestMethod.GET)
	@ResponseBody
	public boolean validateTime(Model model, @RequestParam Integer startDate, @RequestParam Integer startHours, @RequestParam Integer startMinutes, @RequestParam Integer duration){
		return Concert.isAvailableReserveTime(startDate, startHours, startMinutes, duration, 1); // hall number 1
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value ="/manage/{bandId}", method = RequestMethod.GET)
	public String manage(Model model, @PathVariable long bandId){
		model.addAttribute("command", Concert.findConcertListByBand(bandId));
		return "concert/manage";
	}
	
	@RequestMapping(value = "/plan", method = RequestMethod.GET)
	public void getConcert(Model model, @RequestParam Integer startDate , @RequestParam Integer endDate) throws JsonGenerationException, JsonMappingException, IOException{
		List<Concert> concertList = Concert.findConcertListByDateRange(startDate, endDate);
		List<Event> eventList = new ArrayList<Event>();
		for(int i=0; i<concertList.size(); i++){
			Event event = new Event();
			Concert concert = concertList.get(i);
			event.setTitle(concert.getTitle());
			event.setStartYear(concert.getStartDate()/10000);
			event.setStartMonth(concert.getStartDate()/100%100);
			event.setStartDay(concert.getStartDate()%100);
			event.setStartHours(concert.getStartHours());
			event.setStartMinutes(concert.getStartMinutes());
			
			Calendar end = DateUtil.getCalendar();
			end.set(concert.getStartDate()/10000, concert.getStartDate()/100%100 -1, concert.getStartDate()%100, concert.getStartHours(), concert.getStartMinutes() + concert.getDuration());
			
			event.setEndYear(end.get(Calendar.YEAR));
			event.setEndMonth(end.get(Calendar.MONTH)+1);
			event.setEndDay(end.get(Calendar.DAY_OF_MONTH));
			event.setEndHours(end.get(Calendar.HOUR_OF_DAY));
			event.setEndMinutes(end.get(Calendar.MINUTE));
			
			eventList.add(event);
		}
		model.addAttribute("command", eventList);
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String reserve(@Valid @ModelAttribute("command") Concert concert, BindingResult bindingResult, Model model) throws IOException {

		if (bindingResult.hasErrors()) {
			return "concert/reserve";
		} else {
			
			Calendar endCal = DateUtil.getCalendar(concert.getStartDate()/10000, concert.getStartDate()/100%100 -1, concert.getStartDate()%100, concert.getStartHours(),concert.getStartMinutes()+concert.getDuration());
			
			concert.setEndDate(endCal.get(Calendar.YEAR)*10000+(endCal.get(Calendar.MONTH)+1)*100+endCal.get(Calendar.DAY_OF_MONTH));
			concert.setEndHours(endCal.get(Calendar.HOUR_OF_DAY));
			concert.setEndMinutes(endCal.get(Calendar.MINUTE));
			
			concert.setHall(Hall.findHall(concert.getHallId()));
			concert.setBandInfo(BandInfo.findBandInfo(concert.getBandId()));
			
			concert.setHasBg(true);
			
			concert.persist();
			
			fileService.save(fileService.load("img/concertbg" + (java.lang.Math.round(java.lang.Math.random() * 2) + 1) + ".jpg"), "concertbg/" + concert.getId().toString(), true);
			
			if (concert.getPhoto() != null && concert.getPhoto().getSize() > 0) {
				fileService.save(concert.getPhoto(), "concertphoto/" + concert.getId().toString(), true);
				fileService.save(imageService.generateThumb(concert.getPhoto()), "concertthumb/" + concert.getId().toString(), true);
			} else {
				File file = fileService.load("img/blankconcert.jpg");
				fileService.save(file, "concertphoto/" + concert.getId().toString(), true);
				fileService.save(imageService.generateThumb(file), "concertthumb/" + concert.getId().toString(), true);
			}
			
			return "redirect:/concert";
		}
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{concertId}", method = RequestMethod.GET)
	public String view(@PathVariable("concertId") Long concertId, Model model) {
		Concert concert = Concert.findConcert(concertId);
		model.addAttribute("command", concert);
		concert.setTotalAudienceCount(concert.getTotalAudienceCount()+1);
		concert.merge(); // increase total audienceCount
		return "concert/view";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/{concertId}/state") 
	public void getConcertInfo(@PathVariable("concertId") Long concertId, Model model)
	{
		Concert concert = Concert.findConcert(concertId);
		
		if (concert == null) 
		{
			model.addAttribute("command", ConcertState.FAILED);
		}
		else 
		{
			model.addAttribute("command", concert.getState());
		}
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/{concertId}/remainTime") 
	public void getRemainTime(@PathVariable("concertId") Long concertId, Model model)
	{
		Concert concert = Concert.findConcert(concertId);

		if (concert == null) 
		{
			model.addAttribute("command", 0);
		}
		else 
		{
			model.addAttribute("command", concert.remainTimeInMillis());
		}
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{concertId}/admin", method = RequestMethod.GET)
	public String viewAdmin(@PathVariable("concertId") Long concertId, Model model) {
		model.addAttribute("command", Concert.findConcert(concertId));

		return "concert/viewAdmin";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/{concertId}/changeBG", method = RequestMethod.POST)
	public String changeBG(@PathVariable("concertId") Long concertId, @RequestParam CommonsMultipartFile bg, Model model) throws IOException {
		
		Concert concert = Concert.findConcert(concertId);
		
		if (bg != null && bg.getSize() > 0) {
					
			fileService.save(bg, "concertbg/" + concertId.toString(), true);
			
			concert.setHasBg(true);
			concert.merge();
			
			rtwService.send("Concert", concert.getId(), "changebg", true);
		}
		
		model.addAttribute("command", concert);
		return "concert/changeBG";
	}

	@Secured("ROLE_USER")
	@RequestMapping(value = "/{concertId}/feed", method = RequestMethod.GET)
	public String viewFeed(@PathVariable("concertId") Long concertId, Model model) {
		model.addAttribute("command", Concert.findConcert(concertId));

		return "concert/viewFeed";
	}

	@Secured("ROLE_USER")
	@RequestMapping("/{concertId}/iconFeed")
	public void iconFeed(@PathVariable("concertId") Long concertId, Long itemId, Model model) {
		Concert concert = Concert.findConcert(concertId);

		if (concert != null) {

			IconFeed iconFeed = new IconFeed();
			iconFeed.setConcert(concert);
			iconFeed.setItem(Item.findItem(itemId));
			iconFeed.setSender(authService.getUserInfo());
			iconFeed.setSendDate(new Date());
			iconFeed.persist();

			rtwService.send("Concert", iconFeed.getConcert().getId(), "iconFeed", iconFeed);
		}
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/{concertId}/userState", method = RequestMethod.POST)
	public void updateUserState(@PathVariable("concertId") Long concertId,@Valid @ModelAttribute("command")UserState userState , BindingResult bindingResult, Model model) {
		Concert concert = Concert.findConcert(concertId);

		if (concert != null) {
			userState.setUserInfo(UserInfo.findUserInfo(userState.getUserID()));

			if (userState.getCameraState()) {
				keyValueListCacheService.addSetElement(getUserCamStateKey(concertId), userState.getUserID().toString());
			} else {
				keyValueListCacheService.removeSetElement(getUserCamStateKey(concertId), userState.getUserID().toString());
			}
			
			rtwService.send("Concert", concert.getId(), "userState", userState);
		}
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/{concertId}/userCamStates", method = RequestMethod.GET)
	public void getUserCamStates(@PathVariable("concertId") Long concertId,@Valid @ModelAttribute("command")UserState userState , BindingResult bindingResult, Model model) {
		Concert concert = Concert.findConcert(concertId);

		if (concert != null) {
			Object[] userIds = keyValueListCacheService.getSetByKey(getUserCamStateKey(concertId)).toArray();
			
			StringBuilder jsonStr = new StringBuilder(1000);
			
			jsonStr.append("{\"command\": {\"list\": [");
			for (int i = 0; i<userIds.length ; i++ ) {
				jsonStr.append(userIds[i]);
				if (i != userIds.length - 1) {
					jsonStr.append(",");
				}
			}
			jsonStr.append("]}}");

			model.addAttribute("json", jsonStr.toString());
		}
	}
	
	private String getUserCamStateKey(Long targetConcertId) {
		return "IndiCrowd:concert:" + targetConcertId + ":usercamstate";
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
