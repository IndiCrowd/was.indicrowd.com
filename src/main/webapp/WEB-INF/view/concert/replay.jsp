<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<sec:authentication property="principal" var="principal" />

<!--
You are free to copy and use this sample in accordance with the terms of the
Apache license (http://www.apache.org/licenses/LICENSE-2.0.html)
-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>공연 리플레이</title>
    <style type="text/css">
      #videoDiv { 
        margin-right: 3px;
      }
      #videoInfo {
        margin-left: 3px;
      }
      .playListTr{
      	background-color: #999999
      }
      .playing{
      	background-color : #AA0000;
      }
    </style>
    <script src="http://www.google.com/jsapi" type="text/javascript"></script>
    <script type="text/javascript">
      google.load("swfobject", "2.1");
      var concertStartSigns = ${concertStartSignListJson};
      var playList=[];
      for(var i=0; i<concertStartSigns.length;i++){
    	  playList[playList.length] = concertStartSigns[i].youtubeToken;
      }
      var nowPlay=0;
      var nowSecond=0;
      var messageJson = [];
      var feedJson = [];
      var nowStatus = -1;
    </script>    
    <script type="text/javascript">
      /*
       * Polling the player for information
       */
      
      // Update a particular HTML element with a new value
      function updateHTML(elmId, value) {
        document.getElementById(elmId).innerHTML = value;
      }
      
      // This function is called when an error is thrown by the player
      function onPlayerError(errorCode) {
        alert("An error occured of type:" + errorCode);
      }
      
      // This function is called when the player changes state
      function onPlayerStateChange(newState) {
        updateHTML("playerState", newState);
        nowStatus = newState;
        if(newState == 0){ // if player End
        	if(playList.length > nowPlay + 1){
        		loadVideo(nowPlay + 1);
        	}
        }
      }
      function dayToString(day){
    	  if(day<10){
    		  return "0"+day;
    	  }else{
    		  return day;
    	  }
      }
      // Display information about the current state of the player
      function updatePlayerInfo() {
        // Also check that at least one function exists since when IE unloads the
        // page, it will destroy the SWF before clearing the interval.
        if(ytplayer && ytplayer.getDuration &&  nowStatus== 1) {
     	  var currentSecond = parseInt(ytplayer.getCurrentTime());
     	  var date = new Date();
          date.setTime(concertStartSigns[nowPlay].startDate+ currentSecond*1000);
     	  if(currentSecond - nowSecond > 1){ //forward
     		 date.setTime(concertStartSigns[nowPlay].startDate+ nowSecond*1000);
     		 for(var i=0 ;i < currentSecond -nowSecond; i++){
     			date.setTime(date.getTime()+1000);
     			showFeedbackByDate(date);
     		 }
     	  }else if(currentSecond - nowSecond < 0){ //rewind
     		  for(var i=0;i<nowSecond-currentSecond;i++){
     			 date.setTime(date.getTime()+1000);
     			 removeFeed(dateToKey(date));
     		  }
     	  }else{
     		 showFeedbackByDate(date);
     	  }
          
          nowSecond = currentSecond;
          
          /*updateHTML("videoDuration", ytplayer.getDuration());
          updateHTML("videoCurrentTime", dateToKey(date));
          updateHTML("bytesTotal", ytplayer.getVideoBytesTotal());
          updateHTML("startBytes", ytplayer.getVideoStartBytes());
          updateHTML("bytesLoaded", ytplayer.getVideoBytesLoaded());*/
          
          
        }
      }

      function showFeedbackByDate(date){
    	//print chat, feed
    	  var key=dateToKey(date);
          var messages = messageJson[key];
          if(messages!=null){
	          for(var i=0;i<messages.length;i++){
	        	  var message = messages[i];
	        	  addMessage(message,key);
	        	  addImg(null,message.sender);
	        	  displayMessageOnUser(message);
	        	  //$("#messages").append("<li class='message"+key+"'>"+message.senderName+":"+message.content+"</li>");
	          }
          }
          var feeds = feedJson[key];
          if(feeds!=null){
	          for(var i=0;i<feeds.length;i++){
	        	  var feed = feeds[i];
	        	  console.log(feed);
	        	  addImg(null,feed.sender);
	        	  iconFeedFunction(feed);
	        	 // $("#feeds").append("<li class='feed"+key+"''>"+feed.senderName+":item["+feed.itemId+"]</li>");
	          }
          }
      }
      function removeFeed(key){
    	  $(".message"+key).remove();
    	  //$(".feed"+key).remove();
      }
      function dateToKey(date){
    	 return date.getFullYear()+dayToString(date.getMonth()+1)+dayToString(date.getDate())+dayToString(date.getHours())+dayToString(date.getMinutes())+dayToString(date.getSeconds())
      }
      
      // This function is automatically called by the player once it loads
      function onYouTubePlayerReady(playerId) {
        ytplayer = document.getElementById("ytPlayer");
        // This causes the updatePlayerInfo function to be called every 250ms to
        // get fresh data from the player
        setInterval(updatePlayerInfo, 1000);
        updatePlayerInfo();
        ytplayer.addEventListener("onStateChange", "onPlayerStateChange");
        ytplayer.addEventListener("onError", "onPlayerError");
      }
      
      // The "main method" of this sample. Called when someone clicks "Run".
      function init(videoID) {
        // Lets Flash from another domain call JavaScript
        var params = { allowScriptAccess: "always" };
        // The element id of the Flash embed
        var atts = { id: "ytPlayer" };
        // All of the magic handled by SWFObject (http://code.google.com/p/swfobject/)
        swfobject.embedSWF("http://www.youtube.com/v/" + videoID + 
                           "?version=3&enablejsapi=1&playerapiid=player1", 
                           "videoDiv", "480", "295", "9", null, null, params, atts);
        managePlayCss(0);
      }
   		// Loads the selected video into the player.
      function loadVideo(index) {
        
        if(ytplayer) {
          ytplayer.loadVideoById(playList[index]);
          nowPlay = index;
          managePlayCss(index);
          $("#messages").html("");
          $("#feeds").html("");
        }
      }
      function _run() {
        init(playList[0]);
      }
      function managePlayCss(index){
    	  $(".playListTr").removeClass("playing");
          $("#playList"+index).addClass("playing");
      }
      google.setOnLoadCallback(_run);
    </script>
  </head>
  <body style="font-family: Arial;border: 0 none;">
    <table>
    <tr>
    <td><div id="videoDiv">Loading...</div></td>
    <td valign="top">
    	<table id="videoList">
    		
    		<c:forEach items="${concertStartSignList }" var="startSign" varStatus="i">
    		<tr id="playList${i.index }" class="playListTr">
    			<td><a href="javascript:loadVideo(${i.index });void(0)">${i.index+1 }. ${startSign.startDate } ~</a></td>
    		</tr>
    		</c:forEach>
    	</table>
    </td>
    </tr>
    <tr>
    <td  colspan="2" valign="top">
      <div id="videoInfo">
        <p>Player state: <span id="playerState">--</span></p>
        <p>Current Time: <span id="videoCurrentTime">--:--</span> | Duration: <span id="videoDuration">--:--</span></p>
        <p>Bytes Total: <span id="bytesTotal">--</span> | Start Bytes: <span id="startBytes">--</span> | Bytes Loaded: <span id="bytesLoaded">--</span></p>
      </div>
    </td></tr>
    </table>
    <div id="chatFlow">
    	<!-- ul id="messages">
    	</ul-->
    </div>
    <div id="feedFlow">
    	<ul id="feeds">
    	</ul>
    </div>
   <script>
   	$(function(){
   		$("#userface-wrapper").append($("#videoList"));
   		$("#function-wrapper").remove();
   		$("#form-wrapper").remove();

   	})
   	messageJson= ${messageHash}
   	feedJson = ${feedHash}
   	
   </script>
  </body>
  
</html>
​