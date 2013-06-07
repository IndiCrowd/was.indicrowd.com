package com.indicrowd.concert;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.indicrowd.KeyValueListCacheService;
import com.indicrowd.concert.model.Concert;
import com.indicrowd.concert.model.ConcertState;
import com.indicrowd.rtw.RTWService;
import com.indicrowd.server.StreamingServerInfo;

@Service
public class ConcertService {
	
	private static Logger logger = Logger.getLogger(ConcertService.class);
	
	@Autowired
	KeyValueListCacheService keyValueService;
	
	@Autowired
	protected RTWService rtwService;
	
	ObjectMapper objMapper = new ObjectMapper();
	public static final String channelName = "commonChannel";
	public static final String startConcertKey ="startConcertEventList";
	public static final String endConcertKey = "endConcert_";
	public void whenConcertStart(List<Concert> concertList) throws IOException{
		
		for(int i=0; i<concertList.size();i++){
			logger.info("Start Concert : " + concertList.get(i).getId());
			
			keyValueService.addSetElement(startConcertKey, String.valueOf(concertList.get(i).getId()));
			keyValueService.publish(channelName, "startConcert");
			rtwService.send("Concert", concertList.get(i).getId(), "concertState", ConcertState.PLAYING.toString());
		}
	}
	
	public void whenConcertEnd(List<Concert> concertList) throws IOException{
		
		for(int i=0; i<concertList.size();i++){
			String concertId = String.valueOf(concertList.get(i).getId());
			keyValueService.removeSetElement(startConcertKey, concertId);
			keyValueService.publish(channelName, endConcertKey+concertId);
			rtwService.send("Concert", concertList.get(i).getId(), "concertState", ConcertState.END.toString());
		}
	}
	
	public void manageConcertList(List<Concert> concertList) throws  IOException{
		
		for(int i=0; i<concertList.size();i++){
			
		}
	}
	
	public void sendHttpRequest() throws IOException{
		// i.e.: request = "http://example.com/index.php?param1=a&param2=b&param3=c";
		List<StreamingServerInfo> streamingServer = StreamingServerInfo.findAllStreamingServerInfoes();
		if(streamingServer.size()>0){
			String ip = streamingServer.get(0).getHostname();
			String port = String.valueOf(streamingServer.get(0).getHttpPort());
			String request = "http://"+ip+":"+port+"/manager/?concertId=1&eventType=0";
			//System.out.println("Send Request to "+request);
		    URL url = new URL(request); 
		    HttpURLConnection connection = (HttpURLConnection) url.openConnection();           
		    connection.setDoOutput(true); 
		    connection.setInstanceFollowRedirects(false); 
		    connection.setRequestMethod("GET"); 
		    connection.setRequestProperty("Content-Type", "text/plain"); 
		    connection.setRequestProperty("charset", "utf-8");
		    connection.connect();
		}
	}
}
