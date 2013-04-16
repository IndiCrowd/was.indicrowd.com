package com.indicrowd.server;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.indicrowd.AbstractController;
import com.indicrowd.band.BandInfo;
import com.indicrowd.tag.Tag;

@Controller
@RequestMapping("/server")
public class ServerController extends AbstractController {
	
	@Value("#{userfileConfig.baseUrl}")
	private String baseUrl;
	
	@Autowired
	ServerService serverService;
	
	@RequestMapping(value = "/streaming", method = RequestMethod.GET)
	public void getStreamingServerInfo(Model model) {
		List<StreamingServerInfo> streamingServer = StreamingServerInfo.findAllStreamingServerInfoes();
		
		model.addAttribute("command", streamingServer);
	}
	
	@RequestMapping(value = "/streaming/optimal", method = RequestMethod.GET)
	public void getStreamingServerOptimalInfo(Model model) {
		List<StreamingServerInfo> streamingServer = StreamingServerInfo.findAllStreamingServerInfoes();
		
		model.addAttribute("command", streamingServer.get(0));
	}
	
	@RequestMapping(value = "/multimedia", method = RequestMethod.GET)
	public void getMultimediaServerOptimalInfo(Model model) {
		MultimediaServerInfo msi = new MultimediaServerInfo();
		
		msi.setUrl(baseUrl);
		
		model.addAttribute("command", msi);
		
	}
	
	
}
