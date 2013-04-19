package com.indicrowd.concert;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.springframework.stereotype.Service;

import com.indicrowd.concert.model.Concert;
import com.indicrowd.server.StreamingServerInfo;

@Service
public class ConcertService {
	
	
	public void whenConcertStart(List<Concert> concertList){
		
	}
	
	public void whenConcertEnd(List<Concert> concertList){
		
	}
	
	public void manageConcertList(List<Concert> concertList){
		
	}
	
	public void sendHttpRequest() throws IOException{
		// i.e.: request = "http://example.com/index.php?param1=a&param2=b&param3=c";
		List<StreamingServerInfo> streamingServer = StreamingServerInfo.findAllStreamingServerInfoes();
		if(streamingServer.size()>0){
			String ip = streamingServer.get(0).getHostname();
			String port = "8080";
		    URL url = new URL("http://"+ip); 
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
