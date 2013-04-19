package com.indicrowd.concert;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.indicrowd.KeyValueListCacheService;
import com.indicrowd.concert.model.Concert;
import com.indicrowd.server.StreamingServerInfo;

@Service
public class ConcertService {
	
	
	@Autowired
	KeyValueListCacheService keyValueService;
	
	ObjectMapper objMapper = new ObjectMapper();
	
	public void whenConcertStart(List<Concert> concertList) throws IOException{
		
		keyValueService.set("startConcertList", objMapper.writeValueAsString(concertList));
		for(int i=0; i<concertList.size();i++){
			//sendHttpRequest();
		}
		System.out.println(keyValueService.get("startConcertList"));
	}
	
	public void whenConcertEnd(List<Concert> concertList) throws IOException{
		keyValueService.set("endConcertList", objMapper.writeValueAsString(concertList));
		for(int i=0; i<concertList.size();i++){
			
		}
	}
	
	public void manageConcertList(List<Concert> concertList) throws  IOException{
		keyValueService.set("nowConcertList", objMapper.writeValueAsString(concertList));
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
			System.out.println("Send Request to "+request);
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
