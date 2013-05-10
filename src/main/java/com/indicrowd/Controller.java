package com.indicrowd;

import java.util.Collections;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.indicrowd.band.BandInfo;
import com.indicrowd.concert.model.Concert;
import com.indicrowd.server.StreamingServerInfo;

@org.springframework.stereotype.Controller
public class Controller extends AbstractController {

	@RequestMapping("/signin")
	public void signin() {
	}

	@RequestMapping("/")
	public String main() {

		if (authService.isAnonymous()) {
			return "redirect:/landing";
		} else {
			return "redirect:/main";
		}
	}
	
	@RequestMapping("/main")
	public void main1(Model model) {
		
		List<BandInfo> bandList = BandInfo.findAllBandInfoes();
		Collections.reverse(bandList);
		
		model.addAttribute("bands", bandList);
		model.addAttribute("comingUpConcertList", Concert.findComingUpConcertList(3));
		model.addAttribute("previousConcertList", Concert.findPreviousConcertList(3));
	}
	
	@RequestMapping("/landing")
	public void landing() {
	}

	@RequestMapping("/jwp")
	public String jwp() {
		return "jwp";
	}

	@RequestMapping("/about")
	public void about() {
	}

	@RequestMapping("/help")
	public void help() {
	}

	@RequestMapping("/terms")
	public void terms() {
	}

	@RequestMapping("/policy")
	public void policy() {
	}

	@RequestMapping("/contact")
	public void contact() {
	}
	
	@RequestMapping("/energy")
	public void energy() {
	}
	
	@RequestMapping("/c/{concertId}")
	public String c(@PathVariable("concertId") Long concertId, Model model) {
		StreamingServerInfo ssiInfo = StreamingServerInfo.findAllStreamingServerInfoes().get(0);
		
		String liveThumbnailAddr = String.format("http://%s:%d/transcoderthumbnail?application=live&streamname=%d&format=jpeg&size=480x360", 
				ssiInfo.getHostname(),
				ssiInfo.getHttpPort(),
				concertId);
		
		model.addAttribute("command", Concert.findConcert(concertId));
		model.addAttribute("liveThumbnailAddr", liveThumbnailAddr);
		return "c";
	}

}
