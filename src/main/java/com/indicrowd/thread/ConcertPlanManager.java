package com.indicrowd.thread;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.PostConstruct;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.indicrowd.KeyValueListCacheService;
import com.indicrowd.concert.ConcertService;
import com.indicrowd.concert.model.Concert;
import com.indicrowd.util.DateUtil;


@Service
public class ConcertPlanManager {
	
	private static Logger logger = Logger.getLogger(ConcertPlanManager.class);

	@Autowired
	ConcertService concertService;

	@Autowired
	KeyValueListCacheService keyValueService;
	
	@PostConstruct
	public void postConstruct(){
		//init Concert
		Calendar cal = Calendar.getInstance();
		Integer date = DateUtil.calendarToInteger(cal);
		Integer hour = cal.get(Calendar.HOUR_OF_DAY);
		Integer minute = cal.get(Calendar.MINUTE);
		
		
		//date = 20130412;
		//hour = 16;
		//minute = 55;
		
		List<Concert> nowConcertList = Concert.findNowConcertList(date, hour, minute);
		
		keyValueService.delete(ConcertService.startConcertKey);
		for(int i=0; i<nowConcertList.size();i++){
			keyValueService.addSetElement(ConcertService.startConcertKey, String.valueOf(nowConcertList.get(i).getId()));
		}
	}
	public ConcertPlanManager() {
		
		Calendar cal = Calendar.getInstance();

		ScheduledJob job = new ScheduledJob();
		Timer jobScheduler = new Timer();

		
		Date dateObj = new Date(cal.get(Calendar.YEAR) - 1900,
				cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH),
				cal.get(Calendar.HOUR_OF_DAY), cal.get(Calendar.MINUTE) + 1, 0);

		jobScheduler.scheduleAtFixedRate(job, dateObj, 60 * 1000);

	}

	class ScheduledJob extends TimerTask {

		public void run() {
			Calendar cal = Calendar.getInstance();
			Integer date = DateUtil.calendarToInteger(cal);
			Integer hour = cal.get(Calendar.HOUR_OF_DAY);
			Integer minute = cal.get(Calendar.MINUTE);

			//date = 20130412;
			//hour = 16;
			//minute = 55;

			try {
				logger.info("Event Occur");
				concertService.whenConcertStart(Concert.findStartConcertList(date, hour, minute));
				concertService.manageConcertList(Concert.findNowConcertList(date, hour, minute));
				concertService.whenConcertEnd(Concert.findEndConcertList(date,hour, minute));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
}
