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
      #concert-wrapper{
      	height:500px;
      }
      #chat-wrapper{
      	top:300px;
      }
      #info-wrapper{
      	top:600px;
      }
      #stage-wrapper{
      	top:630px;
      }
      #videoDiv { 
        margin-right: 3px;
      }
      #userface-wrapper{
      	overflow-y :scroll;
      }
      #videoList{
      	width:100%;
      }
      #videoInfo {
        margin-left: 3px;
      }
      a {
		  color: #0088cc;
		  text-decoration: none;
		}
		
		a:hover {
		  color: #005580;
		  text-decoration: underline;
		}
      a:focus {
		  outline:none;
		  outline-offset: -2px;
		}
		
		a:hover,
		a:active {
		  outline: none;
		}
      .playListTr{
      	cursor:pointer;
      	color:#FFFFFF;
      	font-size: 18px;
      }
      .playListTr:hover{
      	background-color: #dee0ea;
      	color:#111111
      }
      .playing{
      	background-color : #AA0000;
      }
      .transparent {
		    filter: alpha(opacity=50); /* internet explorer */
		    -khtml-opacity: 0.5;      /* khtml, old safari */
		    -moz-opacity: 0.5;       /* mozilla, netscape */
		    opacity: 0.5;           /* fx, safari, opera */
		}
    </style>
    <script src="http://code.highcharts.com/highcharts.js"></script>
	<script src="http://code.highcharts.com/modules/exporting.js"></script>
    <script src="http://www.google.com/jsapi" type="text/javascript"></script>
    <script type="text/javascript">
    Highcharts.setOptions({
    	global: {
    		useUTC: true
    	}
    });
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
      
      
      // This function is called when an error is thrown by the player
      function onPlayerError(errorCode) {
        alert("An error occured of type:" + errorCode);
      }
      
      // This function is called when the player changes state
      function onPlayerStateChange(newState) {
        
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
      function setPlayerWithTime(time){
    	  console.log('nowTime: '+(time-32400000));
    	  var nowTime = time- 32400000;
    	  var nowIndex = 0;
    	  var nowStartTime = 0;
    	  for(var i=0; i<concertStartSigns.length;i++){
    		  var startTime = concertStartSigns[i].startDate;
        	  
        	  if(nowTime> startTime){
        		  nowIndex = i;
        		  nowStartTime = startTime;
        	  }
          }
    	  console.log("nowTime:"+ nowTime);
    	  console.log("nowIndex:"+nowIndex);
    	  console.log("nowStartTime:"+nowStartTime);
    	  console.log("playTime:"+ (nowTime- nowStartTime)/1000);
    	  var playTime = (nowTime- nowStartTime)/1000;
    	  if(ytplayer){
    		  loadVideo(nowIndex);
    		  ytplayer.seekTo(playTime);
    	  }
      }
      google.setOnLoadCallback(_run);
    </script>
  </head>
  <body style="font-family: Arial;border: 0 none;">
    <table>
    <tr>
    <td><div id="videoDiv">Loading...</div></td>
    <td valign="top">
    	<div id="videoListDiv">
    	<table id="videoList">
    		
    		<c:forEach items="${concertStartSignList }" var="startSign" varStatus="i">
    		<tr id="playList${i.index }" class="playListTr" onClick="javascript:loadVideo(${i.index });">
    			<td>${i.index+1 }. ${startSign.startDate } ~</td>
    		</tr>
    		</c:forEach>
    		
    	</table>
    	</div>
    </td>
    </tr>
    <tr>
    	<td colspan="">
    		<div id="container" style="min-width: 480px; width:100%; height: 180px; margin: 0 auto"></div>
    	</td>
    </tr>
    
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
   var startDate = new Date();
   var concertStartTime = ${concertStartTime};
   startDate.setTime(concertStartTime);
   startDate.setHours(startDate.getHours()+9); // toUTC
   var feedCountList;
   	$(function(){
   		$("#userface-wrapper").append($("#videoList"));
   		$("#function-wrapper").remove();
   		$("#form-wrapper").remove();
		$("#userface-opti").remove();
		
		
		//highchart init
		$('#container').highcharts({
            chart: {
                type: 'spline'
            },title :'',
            xAxis: {
                type: 'datetime'
            },
            legend: {
                enabled:false
            },
            yAxis: {
                title: {
                    text: '관객 호응'
                },
                min: 0,
                minorGridLineWidth: 0,
                gridLineWidth: 0,
                alternateGridColor: null
            },
            tooltip: {
                valueSuffix: ''
            },
            plotOptions: {
                spline: {
                    lineWidth: 4,
                    states: {
                        hover: {
                            lineWidth: 5
                        }
                    },
                    marker: {
                        enabled: false
                    },
                    pointInterval: 30000, // 30 second
                    pointStart: startDate.getTime()
                },
                series: {
                    
                	point: {
                        events: {
                            click: function() {
                               // alert ('Category: '+ this.category +', value: '+ this.x);
                                setPlayerWithTime(this.x);
                            }
                        }
                    }
                }
            },
            series: [{
                name: '관객 호응',
                data: feedCountList
    
            }]
            ,navigation: {
                menuItemStyle: {
                    fontSize: '10px'
                }
            },credits: {
                enabled: false
            },exporting:{
            	enabled: false
            }
            

        });
   	})
   	messageJson= ${messageHash}
   	feedJson = ${feedHash}
   	feedCountList = ${feedCountListJson}
   </script>
  </body>
  
</html>
​