package com.indicrowd.thread;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.indicrowd.concert.ConcertService;
import com.indicrowd.concert.model.Concert;
import com.indicrowd.util.DateUtil;


@Service
public class ConcertPlanManager {
	public ConcertPlanManager(){
		ScheduledJob job = new ScheduledJob();
	      Timer jobScheduler = new Timer();
	      Calendar cal = Calendar.getInstance();
	      Date date = new Date(cal.get(Calendar.YEAR)-1900, cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH), cal.get(Calendar.HOUR_OF_DAY), cal.get(Calendar.MINUTE) + 1, 0);
	      
	      
	      jobScheduler.scheduleAtFixedRate(job,date , 60*1000);
	      
	      
	}
}
class ScheduledJob extends TimerTask {
	
		@Autowired
		ConcertService concertService;
	
	   public void run() {
		   Calendar cal = Calendar.getInstance();
		   Integer date = DateUtil.calendarToInteger(cal);
		   Integer hour =  cal.get(Calendar.HOUR_OF_DAY);
		   Integer minute = cal.get(Calendar.MINUTE);
		   
		   
		   System.out.println("----------------start concert----------------------");
		   concertService.whenConcertStart(Concert.findStartConcertList(date, hour, minute));
		   System.out.println("----------------now concert----------------------");
		   concertService.manageConcertList(Concert.findNowConcertList(date, hour, minute));
		   System.out.println("----------------end concert----------------------");
		   concertService.whenConcertEnd(Concert.findEndConcertList(date, hour, minute));
	   }
	}